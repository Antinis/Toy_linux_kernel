	.file	"printk.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.putc,"ax",@progbits
	.align	2
	.globl	putc
	.type	putc, @function
putc:
.LFB0:
	.file 1 "printk.c"
	.loc 1 4 19
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
	.loc 1 5 3
	lbu	a2,-17(s0)
	li	a7,0
	li	a6,0
	li	a5,0
	li	a4,0
	li	a3,0
	li	a1,0
	li	a0,1
	call	sbi_ecall
	.loc 1 6 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	putc, .-putc
	.section	.text.vprintfmt,"ax",@progbits
	.align	2
	.type	vprintfmt, @function
vprintfmt:
.LFB1:
	.loc 1 8 71
	.cfi_startproc
	addi	sp,sp,-224
	.cfi_def_cfa_offset 224
	sd	ra,216(sp)
	sd	s0,208(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,224
	.cfi_def_cfa 8, 0
	sd	a0,-200(s0)
	sd	a1,-208(s0)
	sd	a2,-216(s0)
	.loc 1 9 9
	sw	zero,-20(s0)
	.loc 1 9 24
	sw	zero,-24(s0)
	.loc 1 10 12
	sd	zero,-32(s0)
	.loc 1 11 5
	j	.L3
.L39:
	.loc 1 12 12
	lw	a5,-20(s0)
	sext.w	a5,a5
	beq	a5,zero,.L4
	.loc 1 13 20
	ld	a5,-208(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 1 13 13
	addiw	a3,a5,-99
	sext.w	a4,a3
	li	a5,21
	bgtu	a4,a5,.L41
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lla	a5,.L7
	add	a5,a4,a5
	lw	a5,0(a5)
	sext.w	a4,a5
	lla	a5,.L7
	add	a5,a4,a5
	jr	a5
	.section	.rodata.vprintfmt,"a",@progbits
	.align	2
	.align	2
.L7:
	.word	.L12-.L7
	.word	.L11-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L10-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L9-.L7
	.word	.L41-.L7
	.word	.L8-.L7
	.word	.L41-.L7
	.word	.L41-.L7
	.word	.L6-.L7
	.section	.text.vprintfmt
.L10:
	.loc 1 15 29
	li	a5,1
	sw	a5,-24(s0)
	.loc 1 16 21
	j	.L37
.L6:
.LBB2:
	.loc 1 20 59
	lw	a5,-24(s0)
	sext.w	a5,a5
	beq	a5,zero,.L14
	ld	a5,-216(s0)
	addi	a4,a5,8
	sd	a4,-216(s0)
	ld	a5,0(a5)
	j	.L15
.L14:
	.loc 1 20 61
	ld	a5,-216(s0)
	addi	a4,a5,8
	sd	a4,-216(s0)
	lw	a5,0(a5)
.L15:
	.loc 1 20 26 discriminator 4
	sd	a5,-104(s0)
	.loc 1 22 25 discriminator 4
	lw	a5,-24(s0)
	sext.w	a5,a5
	beq	a5,zero,.L16
	.loc 1 22 25 is_stmt 0 discriminator 1
	li	a5,15
	j	.L17
.L16:
	.loc 1 22 25 discriminator 2
	li	a5,7
.L17:
	.loc 1 22 25 discriminator 4
	sw	a5,-108(s0)
.LBB3:
	.loc 1 23 29 is_stmt 1 discriminator 4
	lw	a5,-108(s0)
	sw	a5,-36(s0)
	.loc 1 23 21 discriminator 4
	j	.L18
.L21:
.LBB4:
	.loc 1 24 45
	lw	a5,-36(s0)
	slliw	a5,a5,2
	sext.w	a5,a5
	.loc 1 24 40
	ld	a4,-104(s0)
	sra	a5,a4,a5
	.loc 1 24 57
	sext.w	a5,a5
	.loc 1 24 29
	andi	a5,a5,15
	sw	a5,-112(s0)
	.loc 1 25 30
	lw	a5,-112(s0)
	sext.w	a4,a5
	li	a5,9
	bgt	a4,a5,.L19
	.loc 1 25 56 discriminator 1
	lw	a5,-112(s0)
	andi	a5,a5,0xff
	.loc 1 25 30 discriminator 1
	addiw	a5,a5,48
	andi	a5,a5,0xff
	j	.L20
.L19:
	.loc 1 25 74 discriminator 2
	lw	a5,-112(s0)
	andi	a5,a5,0xff
	.loc 1 25 30 discriminator 2
	addiw	a5,a5,87
	andi	a5,a5,0xff
.L20:
	.loc 1 25 30 is_stmt 0 discriminator 4
	sb	a5,-113(s0)
	.loc 1 26 25 is_stmt 1 discriminator 4
	lbu	a5,-113(s0)
	ld	a4,-200(s0)
	mv	a0,a5
	jalr	a4
.LVL0:
	.loc 1 27 28 discriminator 4
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
.LBE4:
	.loc 1 23 74 discriminator 4
	lw	a5,-36(s0)
	addiw	a5,a5,-1
	sw	a5,-36(s0)
.L18:
	.loc 1 23 60 discriminator 2
	lw	a5,-36(s0)
	sext.w	a5,a5
	bge	a5,zero,.L21
.LBE3:
	.loc 1 29 29
	sw	zero,-24(s0)
	.loc 1 29 44
	sw	zero,-20(s0)
	.loc 1 30 21
	j	.L37
.L11:
.LBE2:
.LBB5:
	.loc 1 34 59
	lw	a5,-24(s0)
	sext.w	a5,a5
	beq	a5,zero,.L22
	ld	a5,-216(s0)
	addi	a4,a5,8
	sd	a4,-216(s0)
	ld	a5,0(a5)
	j	.L23
.L22:
	.loc 1 34 61
	ld	a5,-216(s0)
	addi	a4,a5,8
	sd	a4,-216(s0)
	lw	a5,0(a5)
.L23:
	.loc 1 34 26 discriminator 4
	sd	a5,-48(s0)
	.loc 1 35 24 discriminator 4
	ld	a5,-48(s0)
	bge	a5,zero,.L24
	.loc 1 36 29
	ld	a5,-48(s0)
	neg	a5,a5
	sd	a5,-48(s0)
	.loc 1 36 37
	ld	a5,-200(s0)
	li	a0,45
	jalr	a5
.LVL1:
	.loc 1 37 28
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
.L24:
	.loc 1 39 25
	sw	zero,-52(s0)
	.loc 1 40 26
	li	a5,48
	sd	a5,-160(s0)
	sd	zero,-152(s0)
	sd	zero,-144(s0)
	sb	zero,-136(s0)
.LBB6:
	.loc 1 41 31
	ld	a5,-48(s0)
	sd	a5,-64(s0)
	.loc 1 41 21
	j	.L25
.L26:
	.loc 1 42 46 discriminator 3
	ld	a4,-64(s0)
	li	a5,10
	rem	a5,a4,a5
	.loc 1 42 52 discriminator 3
	andi	a5,a5,0xff
	addiw	a5,a5,48
	andi	a4,a5,0xff
	.loc 1 42 39 discriminator 3
	lw	a5,-52(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-144(a5)
	.loc 1 43 29 discriminator 3
	ld	a4,-64(s0)
	li	a5,10
	div	a5,a4,a5
	sd	a5,-64(s0)
	.loc 1 41 51 discriminator 3
	lw	a5,-52(s0)
	addiw	a5,a5,1
	sw	a5,-52(s0)
.L25:
	.loc 1 41 42 discriminator 1
	ld	a5,-64(s0)
	bne	a5,zero,.L26
.LBE6:
.LBB7:
	.loc 1 46 30
	lw	a5,-52(s0)
	sw	a5,-68(s0)
	.loc 1 46 21
	j	.L27
.L28:
	.loc 1 47 25 discriminator 3
	lw	a5,-68(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a5,-144(a5)
	ld	a4,-200(s0)
	mv	a0,a5
	jalr	a4
.LVL2:
	.loc 1 46 49 discriminator 3
	lw	a5,-68(s0)
	addiw	a5,a5,-1
	sw	a5,-68(s0)
.L27:
	.loc 1 46 42 discriminator 1
	lw	a5,-68(s0)
	sext.w	a5,a5
	bge	a5,zero,.L28
.LBE7:
	.loc 1 49 33
	lw	a5,-52(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 49 25
	ld	a5,-32(s0)
	add	a5,a5,a4
	sd	a5,-32(s0)
	.loc 1 50 29
	sw	zero,-24(s0)
	.loc 1 50 44
	sw	zero,-20(s0)
	.loc 1 51 21
	j	.L37
.L8:
.LBE5:
.LBB8:
	.loc 1 55 68
	lw	a5,-24(s0)
	sext.w	a5,a5
	beq	a5,zero,.L29
	.loc 1 55 51
	ld	a5,-216(s0)
	addi	a4,a5,8
	sd	a4,-216(s0)
	ld	a5,0(a5)
	j	.L30
.L29:
	.loc 1 55 70
	ld	a5,-216(s0)
	addi	a4,a5,8
	sd	a4,-216(s0)
	lw	a5,0(a5)
.L30:
	.loc 1 55 35 discriminator 4
	sd	a5,-128(s0)
	.loc 1 56 25 discriminator 4
	sw	zero,-72(s0)
	.loc 1 57 26 discriminator 4
	li	a5,48
	sd	a5,-192(s0)
	sd	zero,-184(s0)
	sd	zero,-176(s0)
	sb	zero,-168(s0)
.LBB9:
	.loc 1 58 40 discriminator 4
	ld	a5,-128(s0)
	sd	a5,-80(s0)
	.loc 1 58 21 discriminator 4
	j	.L31
.L32:
	.loc 1 59 46 discriminator 3
	ld	a4,-80(s0)
	li	a5,10
	remu	a5,a4,a5
	.loc 1 59 52 discriminator 3
	andi	a5,a5,0xff
	addiw	a5,a5,48
	andi	a4,a5,0xff
	.loc 1 59 39 discriminator 3
	lw	a5,-72(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-176(a5)
	.loc 1 60 29 discriminator 3
	ld	a4,-80(s0)
	li	a5,10
	divu	a5,a4,a5
	sd	a5,-80(s0)
	.loc 1 58 60 discriminator 3
	lw	a5,-72(s0)
	addiw	a5,a5,1
	sw	a5,-72(s0)
.L31:
	.loc 1 58 51 discriminator 1
	ld	a5,-80(s0)
	bne	a5,zero,.L32
.LBE9:
.LBB10:
	.loc 1 63 30
	lw	a5,-72(s0)
	sw	a5,-84(s0)
	.loc 1 63 21
	j	.L33
.L34:
	.loc 1 64 25 discriminator 3
	lw	a5,-84(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a5,-176(a5)
	ld	a4,-200(s0)
	mv	a0,a5
	jalr	a4
.LVL3:
	.loc 1 63 49 discriminator 3
	lw	a5,-84(s0)
	addiw	a5,a5,-1
	sw	a5,-84(s0)
.L33:
	.loc 1 63 42 discriminator 1
	lw	a5,-84(s0)
	sext.w	a5,a5
	bge	a5,zero,.L34
.LBE10:
	.loc 1 66 33
	lw	a5,-72(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 66 25
	ld	a5,-32(s0)
	add	a5,a5,a4
	sd	a5,-32(s0)
	.loc 1 67 29
	sw	zero,-24(s0)
	.loc 1 67 44
	sw	zero,-20(s0)
	.loc 1 68 21
	j	.L37
.L9:
.LBE8:
.LBB11:
	.loc 1 72 33
	ld	a5,-216(s0)
	addi	a4,a5,8
	sd	a4,-216(s0)
	ld	a5,0(a5)
	sd	a5,-96(s0)
	.loc 1 73 27
	j	.L35
.L36:
	.loc 1 74 25
	ld	a5,-96(s0)
	lbu	a5,0(a5)
	ld	a4,-200(s0)
	mv	a0,a5
	jalr	a4
.LVL4:
	.loc 1 75 28
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	.loc 1 76 28
	ld	a5,-96(s0)
	addi	a5,a5,1
	sd	a5,-96(s0)
.L35:
	.loc 1 73 28
	ld	a5,-96(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L36
	.loc 1 78 29
	sw	zero,-24(s0)
	.loc 1 78 44
	sw	zero,-20(s0)
	.loc 1 79 21
	j	.L37
.L12:
.LBE11:
.LBB12:
	.loc 1 83 37
	ld	a5,-216(s0)
	addi	a4,a5,8
	sd	a4,-216(s0)
	lw	a5,0(a5)
	.loc 1 83 26
	sb	a5,-129(s0)
	.loc 1 84 21
	lbu	a5,-129(s0)
	ld	a4,-200(s0)
	mv	a0,a5
	jalr	a4
.LVL5:
	.loc 1 85 24
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	.loc 1 86 29
	sw	zero,-24(s0)
	.loc 1 86 44
	sw	zero,-20(s0)
	.loc 1 87 21
	j	.L37
.L4:
.LBE12:
	.loc 1 93 17
	ld	a5,-208(s0)
	lbu	a5,0(a5)
	.loc 1 93 16
	mv	a4,a5
	li	a5,37
	bne	a4,a5,.L38
	.loc 1 94 21
	li	a5,1
	sw	a5,-20(s0)
	j	.L37
.L38:
	.loc 1 97 13
	ld	a5,-208(s0)
	lbu	a5,0(a5)
	ld	a4,-200(s0)
	mv	a0,a5
	jalr	a4
.LVL6:
	.loc 1 98 16
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	j	.L37
.L41:
	.loc 1 90 21
	nop
.L37:
	.loc 1 11 21
	ld	a5,-208(s0)
	addi	a5,a5,1
	sd	a5,-208(s0)
.L3:
	.loc 1 11 12 discriminator 1
	ld	a5,-208(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L39
	.loc 1 101 12
	ld	a5,-32(s0)
	sext.w	a5,a5
	.loc 1 102 1
	mv	a0,a5
	ld	ra,216(sp)
	.cfi_restore 1
	ld	s0,208(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 224
	addi	sp,sp,224
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	vprintfmt, .-vprintfmt
	.section	.text.printk,"ax",@progbits
	.align	2
	.globl	printk
	.type	printk, @function
printk:
.LFB2:
	.loc 1 106 32
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -72
	.cfi_offset 8, -80
	addi	s0,sp,48
	.cfi_def_cfa 8, 64
	sd	a0,-40(s0)
	sd	a1,8(s0)
	sd	a2,16(s0)
	sd	a3,24(s0)
	sd	a4,32(s0)
	sd	a5,40(s0)
	sd	a6,48(s0)
	sd	a7,56(s0)
	.loc 1 107 9
	sw	zero,-20(s0)
	.loc 1 109 5
	addi	a5,s0,64
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	addi	a5,a5,-56
	sd	a5,-32(s0)
	.loc 1 110 11
	ld	a5,-32(s0)
	mv	a2,a5
	ld	a1,-40(s0)
	lla	a0,putc
	call	vprintfmt
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 1 112 12
	lw	a5,-20(s0)
	.loc 1 113 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 112
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	printk, .-printk
	.text
.Letext0:
	.file 2 "/home/kuroneko/lab1/lab2/include/stddef.h"
	.file 3 "/home/kuroneko/lab1/lab2/include/types.h"
	.file 4 "/home/kuroneko/lab1/lab2/arch/riscv/include/sbi.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x3b7
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xb
	.4byte	.LASF18
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.8byte	0
	.4byte	.Ldebug_line0
	.byte	0x7
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.byte	0x8
	.4byte	.LASF4
	.byte	0x2
	.byte	0x4
	.byte	0x17
	.4byte	0x3d
	.byte	0x7
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.byte	0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x8
	.4byte	.LASF5
	.byte	0x2
	.byte	0xa
	.byte	0x1b
	.4byte	0x57
	.byte	0xd
	.byte	0x8
	.4byte	.LASF19
	.byte	0x8
	.4byte	.LASF6
	.byte	0x3
	.byte	0x4
	.byte	0x17
	.4byte	0x3d
	.byte	0xe
	.4byte	.LASF20
	.byte	0x10
	.byte	0x4
	.byte	0x9
	.byte	0x8
	.4byte	0x8d
	.byte	0x9
	.4byte	.LASF7
	.byte	0xa
	.4byte	0x2a
	.byte	0
	.byte	0x9
	.4byte	.LASF8
	.byte	0xb
	.4byte	0x2a
	.byte	0x8
	.byte	0
	.byte	0xf
	.4byte	.LASF21
	.byte	0x4
	.byte	0xe
	.byte	0xf
	.4byte	0x69
	.4byte	0xc6
	.byte	0x2
	.4byte	0x44
	.byte	0x2
	.4byte	0x44
	.byte	0x2
	.4byte	0x5d
	.byte	0x2
	.4byte	0x5d
	.byte	0x2
	.4byte	0x5d
	.byte	0x2
	.4byte	0x5d
	.byte	0x2
	.4byte	0x5d
	.byte	0x2
	.4byte	0x5d
	.byte	0
	.byte	0x10
	.4byte	.LASF22
	.byte	0x1
	.byte	0x6a
	.byte	0x5
	.4byte	0x44
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x114
	.byte	0x6
	.string	"s"
	.byte	0x6a
	.byte	0x18
	.4byte	0x114
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x11
	.byte	0x1
	.string	"res"
	.byte	0x6b
	.byte	0x9
	.4byte	0x44
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7f
	.byte	0x1
	.string	"vl"
	.byte	0x6c
	.byte	0xd
	.4byte	0x4b
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0
	.byte	0xa
	.4byte	0x120
	.byte	0x7
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x12
	.4byte	0x119
	.byte	0x13
	.4byte	.LASF23
	.byte	0x1
	.byte	0x8
	.byte	0xc
	.4byte	0x44
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x373
	.byte	0x14
	.4byte	.LASF10
	.byte	0x1
	.byte	0x8
	.byte	0x1c
	.4byte	0x37e
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7e
	.byte	0x6
	.string	"fmt"
	.byte	0x8
	.byte	0x36
	.4byte	0x114
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7e
	.byte	0x6
	.string	"vl"
	.byte	0x8
	.byte	0x43
	.4byte	0x4b
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7e
	.byte	0x3
	.4byte	.LASF11
	.byte	0x9
	.byte	0x9
	.4byte	0x44
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x3
	.4byte	.LASF12
	.byte	0x9
	.byte	0x18
	.4byte	0x44
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.string	"pos"
	.byte	0xa
	.byte	0xc
	.4byte	0x31
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x4
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x222
	.byte	0x1
	.string	"num"
	.byte	0x14
	.byte	0x1a
	.4byte	0x2a
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x3
	.4byte	.LASF13
	.byte	0x16
	.byte	0x19
	.4byte	0x44
	.byte	0x3
	.byte	0x91
	.byte	0x94,0x7f
	.byte	0x5
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x3
	.4byte	.LASF14
	.byte	0x17
	.byte	0x1d
	.4byte	0x44
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x5
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0x1
	.string	"hex"
	.byte	0x18
	.byte	0x1d
	.4byte	0x44
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x3
	.4byte	.LASF15
	.byte	0x19
	.byte	0x1e
	.4byte	0x119
	.byte	0x3
	.byte	0x91
	.byte	0x8f,0x7f
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0x2a6
	.byte	0x1
	.string	"num"
	.byte	0x22
	.byte	0x1a
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF16
	.byte	0x27
	.byte	0x19
	.4byte	0x44
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x3
	.4byte	.LASF17
	.byte	0x28
	.byte	0x1a
	.4byte	0x383
	.byte	0x3
	.byte	0x91
	.byte	0xe0,0x7e
	.byte	0x4
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x286
	.byte	0x1
	.string	"tmp"
	.byte	0x29
	.byte	0x1f
	.4byte	0x2a
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0
	.byte	0x5
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x1
	.string	"i"
	.byte	0x2e
	.byte	0x1e
	.4byte	0x44
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0
	.byte	0
	.byte	0x4
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.4byte	0x32d
	.byte	0x1
	.string	"num"
	.byte	0x37
	.byte	0x23
	.4byte	0x3d
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0x3
	.4byte	.LASF16
	.byte	0x38
	.byte	0x19
	.4byte	0x44
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x3
	.4byte	.LASF17
	.byte	0x39
	.byte	0x1a
	.4byte	0x383
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7e
	.byte	0x4
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.4byte	0x30d
	.byte	0x1
	.string	"tmp"
	.byte	0x3a
	.byte	0x28
	.4byte	0x3d
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0
	.byte	0x5
	.8byte	.LBB10
	.8byte	.LBE10-.LBB10
	.byte	0x1
	.string	"i"
	.byte	0x3f
	.byte	0x1e
	.4byte	0x44
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7f
	.byte	0
	.byte	0
	.byte	0x4
	.8byte	.LBB11
	.8byte	.LBE11-.LBB11
	.4byte	0x352
	.byte	0x1
	.string	"str"
	.byte	0x48
	.byte	0x21
	.4byte	0x114
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0
	.byte	0x5
	.8byte	.LBB12
	.8byte	.LBE12-.LBB12
	.byte	0x1
	.string	"ch"
	.byte	0x53
	.byte	0x1a
	.4byte	0x119
	.byte	0x3
	.byte	0x91
	.byte	0xff,0x7e
	.byte	0
	.byte	0
	.byte	0x15
	.4byte	0x37e
	.byte	0x2
	.4byte	0x119
	.byte	0
	.byte	0xa
	.4byte	0x373
	.byte	0x16
	.4byte	0x119
	.4byte	0x393
	.byte	0x17
	.4byte	0x3d
	.byte	0x18
	.byte	0
	.byte	0x18
	.4byte	.LASF24
	.byte	0x1
	.byte	0x4
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x6
	.string	"c"
	.byte	0x4
	.byte	0x10
	.4byte	0x119
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
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
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
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
	.byte	0x4
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x5
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x4
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
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0x1
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x5
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
	.byte	0x15
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x18
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
	.file 0 "/home/kuroneko/lab1/lab2/lib" "printk.c"
	.section	.debug_str,"MS",@progbits,1
.LASF13:
	.string	"hexdigits"
.LASF4:
	.string	"size_t"
.LASF10:
	.string	"putch"
.LASF19:
	.string	"__builtin_va_list"
.LASF23:
	.string	"vprintfmt"
.LASF14:
	.string	"halfbyte"
.LASF3:
	.string	"long unsigned int"
.LASF6:
	.string	"uint64"
.LASF21:
	.string	"sbi_ecall"
.LASF20:
	.string	"sbiret"
.LASF9:
	.string	"char"
.LASF24:
	.string	"putc"
.LASF2:
	.string	"long int"
.LASF5:
	.string	"va_list"
.LASF11:
	.string	"in_format"
.LASF15:
	.string	"hexchar"
.LASF12:
	.string	"longarg"
.LASF22:
	.string	"printk"
.LASF8:
	.string	"value"
.LASF17:
	.string	"decchar"
.LASF16:
	.string	"bits"
.LASF7:
	.string	"error"
.LASF18:
	.string	"GNU C17 11.1.0 -march=rv64imafd -mabi=lp64 -mcmodel=medany -mtune=rocket -march=rv64imafd -g -fno-builtin -ffunction-sections -fdata-sections"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/kuroneko/lab1/lab2/lib"
.LASF0:
	.string	"printk.c"
	.ident	"GCC: (g5964b5cd727) 11.1.0"
