#include "sbi.h"
#include "print.h"
#include "proc.h"

extern void test();

int start_kernel()
{
    printk("Kernel is running normally\n");
    schedule();
    test(); // 本实验中不会到这里来吧

	return 0;
}
