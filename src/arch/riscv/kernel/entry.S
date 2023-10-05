    .section .text.entry        # .text.entry段数据
    .align 2                    # _trap程序入口4字节对齐
    .globl _trap                # 程序入口标记
    .globl __dummy
    .globl __switch_to
    .globl __ret_from_fork

__dummy:        # 跳过初次上下文切换，直接跳到用户代码，并切换到用户栈
    csrr t0, sscratch
    csrw sscratch, sp
    add sp, t0, x0
    
    sret

__switch_to:
    # 保存当前线程的ra、sp和s0 ~ s11，到当前线程的thread_struct中
    # C代码中传入的是current和next结构体的指针。利用偏移量访问结构体中的元素。
    # ra偏移量40，sp偏移量48，非临时寄存器的保存地址顺延。
    sd ra, 40(a0)   # ra存到内存中
    sd sp, 48(a0)   # sp存到内存中
    sd s0, 56(a0)
    sd s1, 64(a0)
    sd s2, 72(a0)
    sd s3, 80(a0)
    sd s4, 88(a0)
    sd s5, 96(a0)
    sd s6, 104(a0)
    sd s7, 112(a0)
    sd s8, 120(a0)
    sd s9, 128(a0)
    sd s10, 136(a0)
    sd s11, 144(a0)
    csrr t0, sepc
    sd t0, 152(a0)
    csrr t0, sstatus
    sd t0, 160(a0)
    csrr t0, sscratch
    sd t0, 168(a0)

    # 将下一个线程的thread_struct中的相关数据载入到ra、sp和s0 ~ s11中。
    ld sp, 48(a1)   # sp在内存中取出
    ld s0, 56(a1)
    ld s1, 64(a1)
    ld s2, 72(a1)
    ld s3, 80(a1)
    ld s4, 88(a1)
    ld s5, 96(a1)
    ld s6, 104(a1)
    ld s7, 112(a1)
    ld s8, 120(a1)
    ld s9, 128(a1)
    ld s10, 136(a1)
    ld s11, 144(a1)
    ld ra, 40(a1)   # ra在内存中取出
    ld t0, 152(a1)
    csrw sepc, t0
    ld t0, 160(a1)
    csrw sstatus, t0
    ld t0, 168(a1)
    csrw sscratch, t0

    # 切换页表
    ld t0, 176(a1)
    # satp寄存器只有低44位存储页表入口地址，要先做处理
    srli t0, t0, 12
    li t1, 0x8000000000000000

    or t0, t0, t1
    csrw satp, t0

    # 重置TLB
    sfence.vma zero, zero
    # 清空指令缓存
    fence.i

    ret

_trap:
    # 是用户态则需要交换栈指针
    csrrw t0, sscratch, t0
    beq t0, x0, _smode_trap_1   # 内核态则直接跳过交换
    csrrw t0, sscratch, t0
    csrrw sp, sscratch, sp 
    jal x0, _umode_trap_1
_smode_trap_1:
    csrrw t0, sscratch, t0
_umode_trap_1:
    addi sp, sp, -272
    sd x1, 0(sp)
    sd x2, 8(sp)
    sd x3, 16(sp)
    sd x4, 24(sp)
    sd x5, 32(sp)
    sd x6, 40(sp)
    sd x7, 48(sp)
    sd x8, 56(sp)
    sd x9, 64(sp)
    sd x10, 72(sp)
    sd x11, 80(sp)
    sd x12, 88(sp)
    sd x13, 96(sp)
    sd x14, 104(sp)
    sd x15, 112(sp)
    sd x16, 120(sp)
    sd x17, 128(sp)
    sd x18, 136(sp)
    sd x19, 144(sp)
    sd x20, 152(sp)
    sd x21, 160(sp)
    sd x22, 168(sp)
    sd x23, 176(sp)
    sd x24, 184(sp)
    sd x25, 192(sp)
    sd x26, 200(sp)
    sd x27, 208(sp)
    sd x28, 216(sp)
    sd x29, 224(sp)
    sd x30, 232(sp)
    sd x31, 240(sp)

    csrr t0, sepc
    sd t0, 248(sp)
    csrr t0, sstatus
    sd t0, 256(sp)
    # sscratch也需要保存，因为每个进程的用户栈指针都是不一样的
    csrr t0, sscratch
    sd t0, 264(sp)

    csrr a0, scause
    csrr a1, sepc
    add a2, sp, x0
    jal x1, trap_handler

__ret_from_fork:  
    ld t0, 256(sp)
    csrw sstatus, t0
    ld t0, 248(sp)
    csrw sepc, t0
    ld t0, 264(sp)
    csrw sscratch, t0
    
    ld x1, 0(sp)
    ld x3, 16(sp)
    ld x4, 24(sp)
    ld x5, 32(sp)
    ld x6, 40(sp)
    ld x7, 48(sp)
    ld x8, 56(sp)
    ld x9, 64(sp)
    ld x10, 72(sp)
    ld x11, 80(sp)
    ld x12, 88(sp)
    ld x13, 96(sp)
    ld x14, 104(sp)
    ld x15, 112(sp)
    ld x16, 120(sp)
    ld x17, 128(sp)
    ld x18, 136(sp)
    ld x19, 144(sp)
    ld x20, 152(sp)
    ld x21, 160(sp)
    ld x22, 168(sp)
    ld x23, 176(sp)
    ld x24, 184(sp)
    ld x25, 192(sp)
    ld x26, 200(sp)
    ld x27, 208(sp)
    ld x28, 216(sp)
    ld x29, 224(sp)
    ld x30, 232(sp)
    ld x31, 240(sp)
    ld x2, 8(sp)
    addi sp, sp, 272

    csrrw t0, sscratch, t0
    beq t0, x0, _smode_trap_2
    csrrw t0, sscratch, t0
    csrrw sp, sscratch, sp
    jal x0, _umode_trap_2

_smode_trap_2:
    csrrw t0, sscratch, t0

_umode_trap_2:
    sret
