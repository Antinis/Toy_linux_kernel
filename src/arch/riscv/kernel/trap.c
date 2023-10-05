#include "types.h"
#include "clock.h"
#include "print.h"
#include "proc.h"
#include "syscall.h"
#include "defs.h"

void do_timer_ex()
{
    // if(mm_init_fin==1 && task_init_fin==1)
    do_timer();
}

// 中断处理函数
void handler_interrupt(uint64 scause, uint64 sepc, struct pt_regs *regs)
{
    switch(scause & ~TRAP_MASK)
    {
        case STI:
            // printk("[S] Supervisor Mode Timer Interrupt\n");
            clock_set_next_event(); //设置下一次时钟中断
            // if(mm_init_fin==1 && task_init_fin==1 && setup_vm_final_fin==1)  // 判断init有没有完成
            do_timer(); //线程调度
            break;
        default:
            break;
    }
}

// 例外处理函数
void handler_exception(uint64 scause, uint64 sepc, struct pt_regs *regs)
{
    if(scause==ECALL_FROM_U_MODE)   // 用户态系统调用
    {
        switch(regs->reg[16])
        {
            case SYS_WRITE: // x17: a7; x10: a0
                // 将用户态传递的字符串打印到屏幕上，此处fd为标准输出（1），buf为用户需要打印的起始地址，count为字符串长度，返回打印的字符数
                regs->reg[9]=sys_write(1, (char *)regs->reg[10], regs->reg[11]);
                break;
            case SYS_GETPID:
                // 从current中获取当前的pid放入a0中返回，无参数
                regs->reg[9]=sys_getpid();
                break;
            case SYS_CLONE: // fork()
                regs->reg[9]=sys_clone(regs);
                break;
            default:
                break;
        }

        regs->sepc+=4;   // 下一条继续执行
    }
    else if(
        scause==INSTRUCTION_PAGE_FAULT
        || scause==STORE_AMO_PAGE_FAULT
        || scause==LOAD_PAGE_FAULT
    )
    {
        uint64_t stval=csr_read(stval);
        page_fault_handler(stval);
    }

    return;
}

void trap_handler(uint64 scause, uint64 sepc, struct pt_regs *regs)
{   
    uint64_t stval=csr_read(stval);
    // printk("get trap, scause: %u, sepc: %u, stval: %u, syscall: %u\n", scause, sepc, stval, regs->reg[16]);
    for(int i=0; i<=1000000; i++);

    // 选择终端类型
    if(scause & TRAP_MASK)
        handler_interrupt(scause, sepc, regs);
    else
        handler_exception(scause, sepc, regs);
}
