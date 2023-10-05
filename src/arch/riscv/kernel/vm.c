#include "defs.h"
#include "mm.h"
#include <string.h>
#include "print.h"

int setup_vm_final_fin=0;

/* early_pgtbl: 用于 setup_vm 进行 1GB 的 映射。 */
unsigned long  early_pgtbl[512] __attribute__((__aligned__(0x1000)));   // 这玩意其实就是顶级页表
                                // 对于顶级页表，要求编译器将他的初始地址4KB对齐

void setup_vm(void)
{
    /* 
    1. 由于是进行 1GB 的映射 这里不需要使用多级页表 
    2. 将 va 的 64bit 作为如下划分： | high bit | 9 bit | 30 bit |
        high bit 可以忽略
        中间9 bit 作为 early_pgtbl 的 index
        低 30 bit 作为 页内偏移 这里注意到 30 = 9 + 9 + 12， 即我们只使用根页表， 根页表的每个 entry 都对应 1GB 的区域。 
    3. Page Table Entry 的权限 V | R | W | X 位设置为 1
    */
    // 线性映射虚拟地址到物理地址
    unsigned long va=VM_START;
    unsigned long idx_va=(va>>30)& 0x1ff;
    early_pgtbl[idx_va]=(((unsigned long)PHY_START>>12)<<10) | ((unsigned long)1) |
                        ((unsigned long)1<<1) | ((unsigned long)1<<2) | ((unsigned long)1<<3);
    
    // 物理地址的等值映射
    // unsigned long pa=PHY_START;
    // unsigned long idx_pa=(pa>>30)& 0x1ff;
    // early_pgtbl[idx_pa]=(((unsigned long)PHY_START>>12)<<10) | ((unsigned long)1) | ((unsigned long)1<<3);

    printk("setup_vm done!\n");
    return;
}

unsigned long PG_PPN_MASK=(unsigned long)0xFFFFFFFFFFF<<10;

extern char _stext[];
extern char _etext[];
extern char _srodata[];
extern char _erodata[];
extern char _sdata[];

int have_set(unsigned long *pgtbl, unsigned long idx_1, unsigned long idx_2, unsigned long idx_3)
{   
    // 返回1：顶级页表没有设置
    // 返回2：次级页表没有设置
    // 返回3：末级页表没有设置
    // 返回0：所有页表正常设置
    if((pgtbl[idx_1] & PTE_V)==0)
        return 1;
    else
    {
        unsigned long *addr_2=(unsigned long *)(((pgtbl[idx_1] & PG_PPN_MASK)<<2)+(unsigned long)PA2VA_OFFSET);
        if((addr_2[idx_2] & PTE_V)==0)
            return 2;
        else
        {
            unsigned long *addr_3=(unsigned long *)(((addr_2[idx_2] & PG_PPN_MASK)<<2)+(unsigned long)PA2VA_OFFSET);
            if((addr_3[idx_3] & PTE_V)==0)
                return 3;
            else
                return 0;
        }
    }
}

/* 创建多级页表映射关系 */
void create_mapping(unsigned long *pgtbl, unsigned long va, unsigned long pa, unsigned long sz, int perm)
{
    printk("create_mapping >>>>\n");
    /*
    pgtbl 为根页表的基地址
    va, pa 为需要映射的虚拟地址、物理地址
    sz 为映射的大小
    perm 为映射的读写权限

    创建多级页表的时候可以使用 kalloc() 来获取一页作为页表目录
    可以使用 V bit 来判断页表项是否存在
    */

    /*
    采用类似于DFS的算法探测、构建多级页表
    1. 对于给出的虚拟地址，首先得到三级页表索引。从顶级页表逐级探测，
    2.A. 如果直到探测到最低一级页表，都初始化完成了，退出程序
    2.B.1 否则，返回最低一级没有初始化的页表层级。
    2.B.2. 然后对返回的这一级页表做初始化
    3. 重复1-3步骤，直到程序退出。
    其实就是每次探测都初始化下一级的页表，这样至多三次探测就可以完全初始化这个地址的页表
    */

    // 三级页表索引的位位置掩码
    unsigned long VPN_1_MASK=(unsigned long)0x1FF<<30;
    unsigned long VPN_2_MASK=(unsigned long)0x1FF<<21;
    unsigned long VPN_3_MASK=(unsigned long)0x1FF<<12;

    unsigned long offset;
    unsigned long va_4KB_align=(va>>12)<<12;    // 4KB向下对齐的虚拟地址
    unsigned long pa_4KB_align=(pa>>12)<<12;    // 4KB向下对齐的物理地址
    unsigned long page_size=4096;
    // 顺次扫描每一个4KB块，依次初始化它们的页表
    for(offset=0; va_4KB_align+offset<va+sz; offset+=page_size)
    {
        // 当前正在处理的虚拟地址（4KB对齐）
        unsigned long va_now=va_4KB_align+offset;
        // 三级页表索引
        unsigned long idx_1=(va_now & VPN_1_MASK)>>30;    // 一块1GB
        unsigned long idx_2=(va_now & VPN_2_MASK)>>21;    // 一块2MB
        unsigned long idx_3=(va_now & VPN_3_MASK)>>12;    // 一块4KB

        // 2.1. 如果直到探测到最低一级页表，都初始化完成了，退出程序
        // printk("%u\n", sz);
        if(!have_set(pgtbl, idx_1, idx_2, idx_3))
            continue;
        
        // 2.B.1 否则，返回最低一级没有初始化的页表层级
        int empty_level=have_set(pgtbl, idx_1, idx_2, idx_3);

        // 2.B.2. 然后对返回的这一级页表做初始化
        // 3. 重复1-3步骤，直到程序退出。
        while(empty_level)
        {
            if(empty_level==1)  // 顶级页表没有设置
            {
                unsigned long *pg_2_ptr=(unsigned long *)(kalloc()-(unsigned long)PA2VA_OFFSET);
                pgtbl[idx_1]=((unsigned long)pg_2_ptr>>2) | (0x1UL);
            }

            if(empty_level==2)  // 次级页表没有设置
            {
                unsigned long *pg_3_ptr=(unsigned long *)(kalloc()-(unsigned long)PA2VA_OFFSET);
                unsigned long *addr_2=(unsigned long *)(((pgtbl[idx_1] & PG_PPN_MASK)<<2)+(unsigned long)PA2VA_OFFSET);
                addr_2[idx_2]=((unsigned long)pg_3_ptr>>2) | (0x1UL);
            }

            if(empty_level==3)  // 末级页表没有设置
            {
                unsigned long *addr_2=(unsigned long *)(((pgtbl[idx_1] & PG_PPN_MASK)<<2)+(unsigned long)PA2VA_OFFSET);
                unsigned long *addr_3=(unsigned long *)(((addr_2[idx_2] & PG_PPN_MASK)<<2)+(unsigned long)PA2VA_OFFSET);
                unsigned long pa_now=pa_4KB_align+offset;
                addr_3[idx_3]=(pa_now>>2) | perm;
            }

            empty_level=have_set(pgtbl, idx_1, idx_2, idx_3);
        }
    }
}

/* swapper_pg_dir: kernel pagetable 根目录， 在 setup_vm_final 进行映射。 */
unsigned long  swapper_pg_dir[512] __attribute__((__aligned__(0x1000)));

void setup_vm_final(void)
{
    printk("setup_vm_final start >>>\n");
    memset(swapper_pg_dir, 0x0, PGSIZE);

    // No OpenSBI mapping required
    // mapping kernel text X|-|R|V
    create_mapping(
        swapper_pg_dir,
        (unsigned long)(&_stext),
        (unsigned long)((unsigned long)(&_stext)-(unsigned long)PA2VA_OFFSET),
        (unsigned long)(_etext-_stext+1),
        PTE_X | PTE_R | PTE_V
    );

    // mapping kernel rodata -|-|R|V
    create_mapping(
        swapper_pg_dir,
        (unsigned long)(&_srodata),
        (unsigned long)((unsigned long)(&_srodata)-(unsigned long)PA2VA_OFFSET),
        (unsigned long)(_erodata-_srodata+1),
        PTE_R | PTE_V
    );

    // mapping other memory -|W|R|V
    create_mapping(
        swapper_pg_dir,
        (unsigned long)(&_sdata),
        (unsigned long)((unsigned long)(&_sdata)-(unsigned long)PA2VA_OFFSET),
        (unsigned long)((unsigned long)PHY_END-((unsigned long)_sdata-(unsigned long)PA2VA_OFFSET)+1),
        PTE_W | PTE_R | PTE_V
    );

    // set satp with swapper_pg_dir
    unsigned long pg_tbl_pa=(unsigned long)swapper_pg_dir-(unsigned long)PA2VA_OFFSET;
    unsigned long satp_val=(pg_tbl_pa>>12) | 0x8000000000000000;
    csr_write(satp, satp_val);
    

    // flush TLB
    asm volatile("sfence.vma zero, zero");

    setup_vm_final_fin=1;
    printk("setup_vm_final end >>>\n");

    return;
}