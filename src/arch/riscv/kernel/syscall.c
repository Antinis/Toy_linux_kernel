#include "syscall.h"
#include "types.h"
#include "print.h"
#include "proc.h"
#include "string.h"
#include "defs.h"
#include "vm.h"
#include "trap.h"

extern struct task_struct *current;

uint64_t sys_write(uint64_t fd, char *buffer, uint64_t len)
{
    int i;
    if(fd==1)
        for(i=0; i<len; i++)
            printk("%c", buffer[i]);
        
    return i;
}

uint64_t sys_getpid()
{
    return current->pid;
}

extern struct task_struct *task[];
extern uint64_t tasks_cnt;
extern uint64_t __ret_from_fork;
extern uint64_t swapper_pg_dir[];
uint64_t sys_clone(struct pt_regs *regs)
{
    struct task_struct *new_task_struct=(struct task_struct *)kalloc();
    task[tasks_cnt]=new_task_struct;
    tasks_cnt++;
    // 复制父进程的PCB给子进程
    memcpy((void *)new_task_struct, (void *)current, PGSIZE);

    // 拷页表
    new_task_struct->pgd=(pagetable_t)kalloc();
    memcpy((char *)(new_task_struct->pgd), (char *)(swapper_pg_dir), PGSIZE);
    new_task_struct->pgd=(pagetable_t)((unsigned long)(new_task_struct->pgd)-(unsigned long)PA2VA_OFFSET);
    for(int i=0; i<current->vma_cnt; i++)
    {
        if(current->vmas[i].have_allocated==1)  // 已经被映射的页
        {
            uint64_t new_physics_page=kalloc();
            create_mapping(
                (uint64_t *)((uint64_t)(new_task_struct->pgd)+(uint64_t)PA2VA_OFFSET),
                current->vmas[i].vm_start,
                (uint64_t)(new_physics_page)-(uint64_t)PA2VA_OFFSET,
                PGSIZE,
                PTE_R | PTE_W | PTE_X | PTE_V | PTE_U
            );
            memcpy((void *)new_physics_page, (void *)current->vmas[i].vm_start, PGSIZE);
        }
    }

    // 子进程在父进程的fork断点处继续执行
    // PCB中内核栈中记录了调度时的寄存器状态。为了让子进程返回时pid等值不同于父进程，要对子进程PCB的内核栈进行修改
    new_task_struct->pid=tasks_cnt-1;
    new_task_struct->thread.ra=(uint64_t)&__ret_from_fork;
    struct pt_regs *new_regs=(struct pt_regs *)((uint64_t)new_task_struct+(uint64_t)PGOFFSET((uint64_t)regs));
    new_task_struct->thread.sp=(uint64_t)new_regs;
    new_regs->reg[9]=0; // 返回pid=0代表这是子进程的返回
    new_regs->reg[1]=(uint64_t)new_regs;    // PCB的栈顶指针也变了
    // 每个用户程序都运行在自己的0x0-0x4000000000这一段虚拟地址上，所以fork之后用户栈指针不用变
    // 但是PCB内核栈虽然也在虚拟地址，但是每个进程的地址是不一样的

    new_regs->sepc=regs->sepc+4;  // 父进程在中断处理返回时pc+=4，子进程没有额外处理。所以在这里+=4
    
    printk("process %d forked process %d\n", current->pid, new_task_struct->pid);
    // 对于父进程，会在这里返回，返回pid是自己的pid，子进程的pid在PCB中被修改了寄存器，返回时是0
    return tasks_cnt-2;
}