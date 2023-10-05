# 此程序为C程序分配内存空间，然后跳转到C程序
.extern start_kernel        # 到外部文件去查找start_kernel函数
.extern early_pgtbl

    .section .text.init     # 开始代码段
    .globl _start           # 将_start标记到符号表
.align 2

_start:                     # _start标记代表程序入口
    la sp, boot_stack_top   # 将栈顶地址加载到sp（栈顶指针）寄存器
    
    call setup_vm
    call relocate
    call mm_init
    call setup_vm_final
    call task_init

    la t0, _trap            # 将中断处理程序入口存入t0通用寄存器
    csrw stvec, t0          # 将中断处理程序入口存入stvec寄存器

    csrr t0, sie            # 将sie寄存器现在值读入t0通用寄存器
    ori t0, t0, 0x20        # sie寄存器的STIE位是第五位（从第零位开始）
                            # sie中原值与0x20（BIN: 100000）按位或
                            # 将第五位更新为1，并保留其他位原来的值
    csrw sie, t0            # 由于只能操作通用寄存器
                            # 所以在t0通用寄存器中修改完毕后再写入专用寄存器

    csrr t0, sstatus        # 将sstatus寄存器现在值读入t0通用寄存器
    ori t0, t0, 0x20        # sstatus寄存器的STIE位是第一位（从第零位开始）
                            # sstatus中原值与0x2（BIN: 10）按位或
                            # 将第一位更新为1，并保留其他位原来的值
    csrw sstatus, t0        # 所以在t0通用寄存器中修改完毕后再写入专用寄存器

    # 首次时钟中断由汇编语言设置，之后便可以在中断响应程序中由C程序设置下一次时钟中断
    rdtime t0               # 读现在时钟的伪指令
    li t1, 10000000         # 下一次时钟中断时间
    add a0, t0, t1          # 调用ecall设置时钟中断时，中断时间存储在a0寄存器
    add a6, zero, zero      # 清空a6寄存器代表ecall事件，0x00表示设置时钟中断
    add a7, zero, zero
    ecall

    j start_kernel          # 跳到start_kernel函数

relocate:
    # set ra = ra + PA2VA_OFFSET
    # set sp = sp + PA2VA_OFFSET (If you have set the sp before)

    li t0, 0xFFFFFFDF80000000
    add ra, ra, t0
    add sp, sp, t0

    # set satp with early_pgtbl

    la t0, early_pgtbl
    srai t0, t0, 12
    li t1, 0x8000000000000000
    or t0, t0, t1
    csrw satp, t0

    # flush tlb
    sfence.vma zero, zero

    ret

    .section .bss.stack     # 开始全局未初始化变量段和栈段
    .globl boot_stack       # 将boot_stack标记到符号表
boot_stack:
    .space 4096             # 保留内存空间

    .globl boot_stack_top   # 将boot_stack_top标记到符号表
boot_stack_top:
