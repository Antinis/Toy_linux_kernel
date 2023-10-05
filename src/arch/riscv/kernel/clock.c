#include "clock.h"
#include "sbi.h"

#define TIMECLOCK 10000000

unsigned long get_cycles()
{
    // 本函数获得当前时间戳
    unsigned long n;
    asm volatile(
        "rdtime %0":    // rdtime：读时钟寄存器伪指令
        "=r"(n)         // 将n与%0通用寄存器关联，制导编译器选用寄存器存储n
    );
    return n;
}

void clock_set_next_event()
{
    unsigned long next_time=get_cycles()+TIMECLOCK;
    sbi_ecall(SBI_SET_TIMER, 0, next_time, 0, 0, 0, 0, 0);

    return;
}