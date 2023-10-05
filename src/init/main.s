	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	3
.LC0:
	.string	"Kernel is running normally"
	.section	.text.start_kernel,"ax",@progbits
	.align	2
	.globl	start_kernel
	.type	start_kernel, @function
start_kernel:
.LFB0:
	.file 1 "main.c"
	.loc 1 7 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 8 5
	lla	a0,.LC0
	call	printk
	.loc 1 9 5
	call	test
	.loc 1 11 9
	li	a5,0
	.loc 1 12 1
	mv	a0,a5
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	start_kernel, .-start_kernel
	.text
.Letext0:
	.file 2 "/home/kuroneko/lab1/lab2/include/print.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x91
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x3
	.4byte	.LASF5
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.8byte	0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0x4
	.byte	0xd
	.4byte	0x4d
	.byte	0x2
	.byte	0
	.byte	0x6
	.4byte	.LASF7
	.byte	0x2
	.byte	0x5
	.byte	0x5
	.4byte	0x38
	.4byte	0x64
	.byte	0x7
	.4byte	0x64
	.byte	0x2
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x71
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0x9
	.4byte	0x6a
	.byte	0xa
	.4byte	.LASF8
	.byte	0x1
	.byte	0x6
	.byte	0x5
	.4byte	0x38
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.8byte	0
	.8byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x8
	.byte	0
	.4byte	0
.LLRL0:
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.file 0 "/home/kuroneko/lab1/lab2/init" "main.c"
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"long unsigned int"
.LASF5:
	.string	"GNU C17 11.1.0 -march=rv64imafd -mabi=lp64 -mcmodel=medany -mtune=rocket -march=rv64imafd -g -fno-builtin -ffunction-sections -fdata-sections"
.LASF8:
	.string	"start_kernel"
.LASF3:
	.string	"long int"
.LASF6:
	.string	"test"
.LASF4:
	.string	"char"
.LASF7:
	.string	"printk"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/kuroneko/lab1/lab2/init"
.LASF0:
	.string	"main.c"
	.ident	"GCC: (g5964b5cd727) 11.1.0"
