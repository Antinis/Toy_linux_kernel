	.file	"clock.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.get_cycles,"ax",@progbits
	.align	2
	.globl	get_cycles
	.type	get_cycles, @function
get_cycles:
.LFB0:
	.file 1 "clock.c"
	.loc 1 7 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 10 5
 #APP
# 10 "clock.c" 1
	rdtime a5
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	.loc 1 14 12
	ld	a5,-24(s0)
	.loc 1 15 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	get_cycles, .-get_cycles
	.section	.text.clock_set_next_event,"ax",@progbits
	.align	2
	.globl	clock_set_next_event
	.type	clock_set_next_event, @function
clock_set_next_event:
.LFB1:
	.loc 1 18 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 19 29
	call	get_cycles
	mv	a4,a0
	.loc 1 19 19
	li	a5,9998336
	addi	a5,a5,1664
	add	a5,a4,a5
	sd	a5,-24(s0)
	.loc 1 20 5
	li	a7,0
	li	a6,0
	li	a5,0
	li	a4,0
	li	a3,0
	ld	a2,-24(s0)
	li	a1,0
	li	a0,0
	call	sbi_ecall
	.loc 1 22 5
	nop
	.loc 1 23 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	clock_set_next_event, .-clock_set_next_event
	.text
.Letext0:
	.file 2 "/home/kuroneko/lab1/lab2/arch/riscv/include/sbi.h"
	.file 3 "/home/kuroneko/lab1/lab2/include/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xfd
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.4byte	.LASF9
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.8byte	0
	.4byte	.Ldebug_line0
	.byte	0x5
	.4byte	.LASF10
	.byte	0x3
	.byte	0x4
	.byte	0x17
	.4byte	0x36
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.byte	0x6
	.4byte	.LASF11
	.byte	0x10
	.byte	0x2
	.byte	0x9
	.byte	0x8
	.4byte	0x60
	.byte	0x3
	.4byte	.LASF2
	.byte	0xa
	.4byte	0x60
	.byte	0
	.byte	0x3
	.4byte	.LASF3
	.byte	0xb
	.4byte	0x60
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.byte	0x7
	.4byte	.LASF12
	.byte	0x2
	.byte	0xe
	.byte	0xf
	.4byte	0x3c
	.4byte	0x9f
	.byte	0x1
	.4byte	0x9f
	.byte	0x1
	.4byte	0x9f
	.byte	0x1
	.4byte	0x2a
	.byte	0x1
	.4byte	0x2a
	.byte	0x1
	.4byte	0x2a
	.byte	0x1
	.4byte	0x2a
	.byte	0x1
	.4byte	0x2a
	.byte	0x1
	.4byte	0x2a
	.byte	0
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x9
	.4byte	.LASF6
	.byte	0x1
	.byte	0x11
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0xd4
	.byte	0xa
	.4byte	.LASF8
	.byte	0x1
	.byte	0x13
	.byte	0x13
	.4byte	0x36
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xb
	.4byte	.LASF7
	.byte	0x1
	.byte	0x6
	.byte	0xf
	.4byte	0x36
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.string	"n"
	.byte	0x1
	.byte	0x9
	.byte	0x13
	.4byte	0x36
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2
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
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x34
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
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
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.file 0 "/home/kuroneko/lab1/lab2/arch/riscv/kernel" "clock.c"
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"next_time"
.LASF4:
	.string	"long unsigned int"
.LASF5:
	.string	"long int"
.LASF12:
	.string	"sbi_ecall"
.LASF9:
	.string	"GNU C17 11.1.0 -march=rv64imafd -mabi=lp64 -mcmodel=medany -mtune=rocket -march=rv64imafd -g -fno-builtin -ffunction-sections -fdata-sections"
.LASF3:
	.string	"value"
.LASF10:
	.string	"uint64"
.LASF2:
	.string	"error"
.LASF7:
	.string	"get_cycles"
.LASF6:
	.string	"clock_set_next_event"
.LASF11:
	.string	"sbiret"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"clock.c"
.LASF1:
	.string	"/home/kuroneko/lab1/lab2/arch/riscv/kernel"
	.ident	"GCC: (g5964b5cd727) 11.1.0"
