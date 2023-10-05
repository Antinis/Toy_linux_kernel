#include "proc.h"
#include "defs.h"
#include "mm.h"
#include "vm.h"
#include "string.h"
#include "types.h"

extern void __dummy();

struct task_struct* idle;           // idle process
struct task_struct* current;        // 指向当前运行线程的 `task_struct`
uint64_t tasks_cnt=2;
struct task_struct* task[MAX_TASKS]; // 线程数组，所有的线程都保存在此
extern char uapp_start[];
extern char uapp_end[];
extern unsigned long *swapper_pg_dir;

int task_init_fin=0;

void page_fault_handler(uint64_t stval)
{
    struct vm_area_struct *vma=find_vma(current, stval);    // 首先查找访问的地址在vma中是否有记录
    if(!vma)    // 如果没有记录则是意外情况
        printk("Fatal Error: stval dose not exist in vmas! stval: %u\n", stval);
    else    // 有记录的话就分配一个物理页
    {
        uint64_t new_page=kalloc();
        create_mapping(
            (uint64_t *)((uint64_t)(current->pgd)+(uint64_t)PA2VA_OFFSET),
            stval,
            (uint64_t)(new_page)-(uint64_t)PA2VA_OFFSET,
            PGSIZE,
            PTE_R | PTE_W | PTE_X | PTE_V | PTE_U
        );
        // 如果非匿名则是磁盘映射，要拷贝
        if(!(vma->vm_flags&VM_ANONYM))
            memcpy((void *)new_page, (void *)vma->vm_content_offset, vma->vm_end-vma->vm_start+1);
        
        vma->have_allocated=1;  // 标记“已分配”
    }
}

/*
* @mm          : current thread's mm_struct
* @address     : the va to look up
*
* @return      : the VMA if found or NULL if not found
*/
struct vm_area_struct *find_vma(struct task_struct *task, uint64_t addr)
{
    for(int i=0; i<task->vma_cnt; i++)
    {
        if(addr>=task->vmas[i].vm_start && addr<=task->vmas[i].vm_end)
            return &(task->vmas[i]);
    }

    return NULL;
}

/*
 * @mm     : current thread's mm_struct
 * @addr   : the suggested va to map
 * @length : memory size to map
 * @prot   : protection
 *
 * @return : start va
*/
uint64_t do_mmap(struct task_struct *task, uint64_t addr, uint64_t length, int prot, uint64_t vm_content_offset)
{
    struct vm_area_struct *new_vma=&(task->vmas[task->vma_cnt++]);

    new_vma->vm_start=addr;
    new_vma->vm_end=addr+length-1;
    new_vma->vm_flags=prot;
    new_vma->vm_content_offset=vm_content_offset;
    new_vma->have_allocated=0;

    return addr;
} 

void load_binary_program(struct task_struct *task)
{
    // 记录代码
    do_mmap(task, USER_START, (uint64_t)(uapp_end)-(uint64_t)(uapp_start)+1, VM_X_MASK | VM_R_MASK | VM_W_MASK, uapp_start);

    // 记录用户栈
    do_mmap(task, (uint64_t)USER_END-(uint64_t)PGSIZE, PGSIZE, VM_R_MASK | VM_W_MASK | VM_ANONYM, 0);
    printk("(load_binary_program) user stack: %u\n", task->vmas[1].vm_start);
 
    task->thread.sepc=USER_START;
    task->thread.sscratch=USER_END; // 指向用户栈栈顶
    task->thread.sstatus=(1<<18) | (1<<5);  // 权限

    return;
}

void task_init()
{
    printk("proc_init start...\n");
    // 1. 调用 kalloc() 为 idle 分配一个物理页
    idle=(struct task_struct *)kalloc();
    // 2. 设置 state 为 TASK_RUNNING;
    idle->state=TASK_RUNNING;
    // 3. 由于 idle 不参与调度 可以将其 counter / priority 设置为 0
    idle->counter=0;
    idle->priority=0;
    // 4. 设置 idle 的 pid 为 0
    idle->pid=0;
    idle->pgd=swapper_pg_dir;
    idle->thread.sscratch=0;
    // 5. 将 current 和 task[0] 指向 idle
    current=idle;
    task[0]=idle;
    printk("proc_init for idle finish\n");
    
    // 1. 参考 idle 的设置, 为 task[1] ~ task[NR_TASKS - 1] 进行初始化
    // 2. 其中每个线程的 state 为 TASK_RUNNING, counter 为 0, priority 使用 rand() 来设置, pid 为该线程在线程数组中的下标。
    for(int i=1; i<=1; i++) // 一开始只初始化一个进程
    {
        task[i]=(struct task_struct *)kalloc();
        task[i]->state=TASK_RUNNING;
        task[i]->counter=0;
        task[i]->priority=rand();
        task[i]->pid=i;

        task[i]->pgd=(pagetable_t)alloc_page(); // 页表首地址，虚拟地址
        // 拷贝内核态页表
        memcpy((void *)(task[i]->pgd), (void *)(&swapper_pg_dir), PGSIZE);
        // for(int i=0; i<512; i++)
        //     printk("%u ", swapper_pg_dir[i]);
        // 页表的入口地址是物理地址
        task[i]->pgd=(unsigned long)(task[i]->pgd)-(unsigned long)PA2VA_OFFSET;

        load_binary_program(task[i]);

        // 3. 为 task[1] ~ task[NR_TASKS - 1] 设置 `thread_struct` 中的 `ra` 和 `sp`
        // 4. 其中 `ra` 设置为 __dummy （见 4.3.2）的地址， `sp` 设置为 该线程申请的物理页的高地址
        (task[i]->thread).ra=__dummy;
        (task[i]->thread).sp=(uint64)task[i]+PGSIZE-1;

    }
    
    printk("...proc_init done!\n");
    task_init_fin=1;    // 标志线程初始化有没有完成，防止还没有完成时就在时钟中断内进行线程调度，引发错误
}

extern void __switch_to(struct task_struct* prev, struct task_struct* next);

void switch_to(struct task_struct* next)
{
    // printk("......switch_to......\n");
    // printk("%d %d", next->pid, current->pid);
    if(next->pid!=current->pid)
    {
        // printk("task switch to: ");
        // puti(next->pid);
        // printk("\n\n");
        struct task_struct *tmp=current;
        current=next;
        __switch_to(tmp, next);
    }
    // printk("ook\n");
    
    return;
}

void do_timer(void)
{
    // printk("......do_timer......\n");
    int i;
    // for(i=0; i<=tasks_cnt-1; i++)
    // {
    //     printk("pid: ");
    //     puti(task[i]->pid);
    //     printk("; priority: ");
    //     puti(task[i]->priority);
    //     printk("; remain time: ");
    //     puti(task[i]->counter);
    //     printk("\n");
    // }
    // printk("\n");
    // 1. 如果当前线程是idle线程，直接进行调度
    if(current->pid<=0)
        schedule();
    // 2. 如果当前线程不是idle，对当前线程的运行剩余时间减1；若剩余时间仍然大于0，则直接返回，否则进行调度
    else
    {
        current->counter-=1;
        if(current->counter==0)
            schedule();
    }

    return;
}

void schedule(void)
{
    // printk("......schedule......\n");
    // printk("current pid: ");
    // puti(current->pid);
    // printk("; remaining time: ");
    // puti(current->counter);
    // printk("\n");

    int i;
    int flag=0;
    for(i=1; i<=tasks_cnt-1; i++)
        if(task[i]->counter!=0)
        {
            flag=1;
            break;
        }
    
    if(flag==0) // 这意味着所有线程剩余时间都是0，重新初始化
    {
        // printk("Left time all zero!\n");
        for(i=1; i<=tasks_cnt-1; i++)
            task[i]->counter=rand();
    }

    uint64 next_id=0;
    int min_t=0x3f3f3f3f;
    for(i=1; i<=tasks_cnt-1; i++)    // 寻找剩余时间最少的线程
        if(task[i]->counter<min_t && task[i]->counter!=0 && task[i]->state==TASK_RUNNING)
        {
            min_t=task[i]->counter;
            next_id=i;
        }
    
    // 找到了一个符合要求的进程，切换到它
    // printk("task switch to: ");
    // puti(next_id);
    // printk("\n\n");

    switch_to(task[next_id]);

    return;
}