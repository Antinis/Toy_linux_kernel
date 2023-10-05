	.file	"trap.c"
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
	.string	"[S] Supervisor Mode Timer Interrupt\n"
	.section	.text.handler_interrupt,"ax",@progbits
	.align	2
	.globl	handler_interrupt
	.type	handler_interrupt, @function
handler_interrupt:
.LFB0:
	.file 1 "trap.c"
	.loc 1 9 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	.loc 1 10 19
	ld	a4,-24(s0)
	li	a5,-1
	srli	a5,a5,1
	and	a4,a4,a5
	.loc 1 10 5
	li	a5,5
	bne	a4,a5,.L4
	.loc 1 13 13
	lla	a0,.LC0
	call	printk
	.loc 1 14 13
	call	clock_set_next_event
	.loc 1 15 13
	j	.L3
.L4:
	.loc 1 17 13
	nop
.L3:
	.loc 1 19 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	handler_interrupt, .-handler_interrupt
	.section	.text.handler_exception,"ax",@progbits
	.align	2
	.globl	handler_exception
	.type	handler_exception, @function
handler_exception:
.LFB1:
	.loc 1 21 65
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	.loc 1 22 1
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	handler_exception, .-handler_exception
	.section	.text.trap_handler,"ax",@progbits
	.align	2
	.globl	trap_handler
	.type	trap_handler, @function
trap_handler:
.LFB2:
	.loc 1 25 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	.loc 1 27 8
	ld	a5,-24(s0)
	.loc 1 27 7
	bge	a5,zero,.L7
	.loc 1 28 9
	ld	a2,-40(s0)
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	handler_interrupt
	.loc 1 31 1
	j	.L9
.L7:
	.loc 1 30 9
	ld	a2,-40(s0)
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	handler_exception
.L9:
	.loc 1 31 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	trap_handler, .-trap_handler
	.text
.Letext0:
	.file 2 "/home/kuroneko/lab1/lab2/include/types.h"
	.file 3 "/home/kuroneko/lab1/lab2/include/clock.h"
	.file 4 "/home/kuroneko/lab1/lab2/include/print.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x156
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.4byte	.LASF10
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.8byte	0
	.4byte	.Ldebug_line0
	.byte	0x5
	.4byte	.LASF11
	.byte	0x2
	.byte	0x4
	.byte	0x17
	.4byte	0x36
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x7
	.4byte	.LASF12
	.byte	0x3
	.byte	0x4
	.byte	0x6
	.4byte	0x59
	.byte	0x3
	.byte	0
	.byte	0x8
	.4byte	.LASF13
	.byte	0x4
	.byte	0x5
	.byte	0x5
	.4byte	0x44
	.4byte	0x70
	.byte	0x9
	.4byte	0x70
	.byte	0x3
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x7d
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0xb
	.4byte	0x76
	.byte	0xc
	.4byte	.LASF8
	.byte	0x1
	.byte	0x18
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0xcb
	.byte	0x1
	.4byte	.LASF5
	.byte	0x18
	.byte	0x1a
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.4byte	.LASF6
	.byte	0x18
	.byte	0x29
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1
	.4byte	.LASF7
	.byte	0x18
	.byte	0x36
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0xd
	.4byte	.LASF9
	.byte	0x1
	.byte	0x15
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x114
	.byte	0x1
	.4byte	.LASF5
	.byte	0x15
	.byte	0x1f
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.4byte	.LASF6
	.byte	0x15
	.byte	0x2e
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1
	.4byte	.LASF7
	.byte	0x15
	.byte	0x3b
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0xe
	.4byte	.LASF14
	.byte	0x1
	.byte	0x8
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.4byte	.LASF5
	.byte	0x8
	.byte	0x1f
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.4byte	.LASF6
	.byte	0x8
	.byte	0x2e
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1
	.4byte	.LASF7
	.byte	0x8
	.byte	0x3b
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x2
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
	.byte	0x3
	.byte	0x18
	.byte	0
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
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
	.byte	0xe
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
	.4byte	0x4c
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
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
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
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.file 0 "/home/kuroneko/lab1/lab2/arch/riscv/kernel" "trap.c"
	.section	.debug_str,"MS",@progbits,1
.LASF5:
	.string	"scause"
.LASF8:
	.string	"trap_handler"
.LASF2:
	.string	"long unsigned int"
.LASF3:
	.string	"long int"
.LASF14:
	.string	"handler_interrupt"
.LASF10:
	.string	"GNU C17 11.1.0 -march=rv64imafd -mabi=lp64 -mcmodel=medany -mtune=rocket -march=rv64imafd -g -fno-builtin -ffunction-sections -fdata-sections"
.LASF11:
	.string	"uint64"
.LASF9:
	.string	"handler_exception"
.LASF6:
	.string	"sepc"
.LASF7:
	.string	"regs"
.LASF12:
	.string	"clock_set_next_event"
.LASF4:
	.string	"char"
.LASF13:
	.string	"printk"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"trap.c"
.LASF1:
	.string	"/home/kuroneko/lab1/lab2/arch/riscv/kernel"
	.ident	"GCC: (g5964b5cd727) 11.1.0"
