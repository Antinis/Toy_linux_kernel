	.file	"sbi.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.sbi_ecall,"ax",@progbits
	.align	2
	.globl	sbi_ecall
	.type	sbi_ecall, @function
sbi_ecall:
.LFB0:
	.file 1 "sbi.c"
	.loc 1 9 1
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	s0,104(sp)
	.cfi_offset 8, -8
	addi	s0,sp,112
	.cfi_def_cfa 8, 0
	sd	a2,-64(s0)
	sd	a3,-72(s0)
	sd	a4,-80(s0)
	sd	a5,-88(s0)
	sd	a6,-96(s0)
	sd	a7,-104(s0)
	mv	a5,a0
	sw	a5,-52(s0)
	mv	a5,a1
	sw	a5,-56(s0)
	.loc 1 13 18
	ld	a0,-64(s0)
	.loc 1 14 18
	ld	a1,-72(s0)
	.loc 1 15 18
	ld	a2,-80(s0)
	.loc 1 16 18
	ld	a3,-88(s0)
	.loc 1 17 18
	ld	a4,-96(s0)
	.loc 1 18 18
	ld	a5,-104(s0)
	.loc 1 19 34
	lw	a6,-56(s0)
	.loc 1 20 34
	lw	a7,-52(s0)
	.loc 1 23 2
 #APP
# 23 "sbi.c" 1
	ecall
# 0 "" 2
	.loc 1 31 11
 #NO_APP
	mv	a5,a0
	sd	a5,-48(s0)
	.loc 1 32 11
	mv	a5,a1
	sd	a5,-40(s0)
	.loc 1 34 9
	ld	a5,-48(s0)
	sd	a5,-32(s0)
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	ld	a4,-32(s0)
	ld	a5,-24(s0)
	mv	t1,a4
	mv	t2,a5
	mv	a4,t1
	mv	a5,t2
	.loc 1 35 1
	mv	a0,a4
	mv	a1,a5
	ld	s0,104(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 112
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	sbi_ecall, .-sbi_ecall
	.text
.Letext0:
	.file 2 "/home/kuroneko/lab1/lab2/arch/riscv/include/sbi.h"
	.file 3 "/home/kuroneko/lab1/lab2/include/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x16e
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x6
	.4byte	.LASF12
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.8byte	0
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.LASF13
	.byte	0x3
	.byte	0x4
	.byte	0x17
	.4byte	0x36
	.byte	0x3
	.byte	0x7
	.4byte	.LASF4
	.byte	0x8
	.4byte	.LASF14
	.byte	0x10
	.byte	0x2
	.byte	0x9
	.byte	0x8
	.4byte	0x60
	.byte	0x4
	.4byte	.LASF2
	.byte	0xa
	.4byte	0x60
	.byte	0
	.byte	0x4
	.4byte	.LASF3
	.byte	0xb
	.4byte	0x60
	.byte	0x8
	.byte	0
	.byte	0x3
	.byte	0x5
	.4byte	.LASF5
	.byte	0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x5
	.byte	0xf
	.4byte	0x3c
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x16a
	.byte	0x5
	.string	"ext"
	.byte	0x1d
	.4byte	0x16a
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x5
	.string	"fid"
	.byte	0x26
	.4byte	0x16a
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x2
	.4byte	.LASF6
	.byte	0x5
	.byte	0x32
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x2
	.4byte	.LASF7
	.byte	0x6
	.byte	0x17
	.4byte	0x2a
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x2
	.4byte	.LASF8
	.byte	0x6
	.byte	0x24
	.4byte	0x2a
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x2
	.4byte	.LASF9
	.byte	0x7
	.byte	0x17
	.4byte	0x2a
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x2
	.4byte	.LASF10
	.byte	0x7
	.byte	0x24
	.4byte	0x2a
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x2
	.4byte	.LASF11
	.byte	0x8
	.byte	0x17
	.4byte	0x2a
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x1
	.string	"ret"
	.byte	0xa
	.byte	0x13
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1
	.string	"a0"
	.byte	0xd
	.byte	0x12
	.4byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.string	"a1"
	.byte	0xe
	.byte	0x12
	.4byte	0x2a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.string	"a2"
	.byte	0xf
	.byte	0x12
	.4byte	0x2a
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.string	"a3"
	.byte	0x10
	.byte	0x12
	.4byte	0x2a
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.string	"a4"
	.byte	0x11
	.byte	0x12
	.4byte	0x2a
	.byte	0x1
	.byte	0x5e
	.byte	0x1
	.string	"a5"
	.byte	0x12
	.byte	0x12
	.4byte	0x2a
	.byte	0x1
	.byte	0x5f
	.byte	0x1
	.string	"a6"
	.byte	0x13
	.byte	0x12
	.4byte	0x2a
	.byte	0x1
	.byte	0x60
	.byte	0x1
	.string	"a7"
	.byte	0x14
	.byte	0x12
	.4byte	0x2a
	.byte	0x1
	.byte	0x61
	.byte	0
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x7
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x21
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
	.byte	0x16
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
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
	.file 0 "/home/kuroneko/lab1/lab2/arch/riscv/kernel" "sbi.c"
	.section	.debug_str,"MS",@progbits,1
.LASF4:
	.string	"long unsigned int"
.LASF13:
	.string	"uint64"
.LASF14:
	.string	"sbiret"
.LASF6:
	.string	"arg0"
.LASF5:
	.string	"long int"
.LASF15:
	.string	"sbi_ecall"
.LASF3:
	.string	"value"
.LASF7:
	.string	"arg1"
.LASF8:
	.string	"arg2"
.LASF9:
	.string	"arg3"
.LASF10:
	.string	"arg4"
.LASF11:
	.string	"arg5"
.LASF2:
	.string	"error"
.LASF12:
	.string	"GNU C17 11.1.0 -march=rv64imafd -mabi=lp64 -mcmodel=medany -mtune=rocket -march=rv64imafd -g -fno-builtin -ffunction-sections -fdata-sections"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"sbi.c"
.LASF1:
	.string	"/home/kuroneko/lab1/lab2/arch/riscv/kernel"
	.ident	"GCC: (g5964b5cd727) 11.1.0"
