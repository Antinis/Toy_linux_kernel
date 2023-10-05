#include "types.h"
#include "sbi.h"

// 函数sbi_ecall返回结构体sbiret
struct sbiret sbi_ecall(int ext, int fid, uint64 arg0,
			            uint64 arg1, uint64 arg2,
			            uint64 arg3, uint64 arg4,
			            uint64 arg5) 
{
    struct sbiret ret;

	// 绑定寄存器与C语言变量，通过操作变量操作寄存器
	register uint64 a0 asm ("a0") = (uint64)(arg0);
	register uint64 a1 asm ("a1") = (uint64)(arg1);
	register uint64 a2 asm ("a2") = (uint64)(arg2);
	register uint64 a3 asm ("a3") = (uint64)(arg3);
	register uint64 a4 asm ("a4") = (uint64)(arg4);
	register uint64 a5 asm ("a5") = (uint64)(arg5);
	register uint64 a6 asm ("a6") = (uint64)(fid);
	register uint64 a7 asm ("a7") = (uint64)(ext);

	// 设定寄存器状态，使SBI通过S模式执行系统调用
	__asm__ volatile(
		"ecall"
		: "+r" (a0), "+r" (a1)
		: "r" (a0), "r" (a1), "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
		: "memory"
	);

	// 返回值从寄存器写入内存
	ret.error=a0;
	ret.value=a1;

	return ret;
}
