#include "types.h"

typedef unsigned long* pagetable_t;

#define MAX_TASKS  (1+64) // 用于控制最大线程数量

#define TASK_RUNNING    0 // 为了简化实验，所有的线程都只有一种状态

#define PRIORITY_MIN 1
#define PRIORITY_MAX 10

#define VM_X_MASK         0x0000000000000008
#define VM_W_MASK         0x0000000000000004
#define VM_R_MASK         0x0000000000000002
#define VM_ANONYM         0x0000000000000001

struct vm_area_struct
{
    uint64_t vm_start;          /* Our start address within vm_mm. */
    uint64_t vm_end;            /* The first byte after our end address 
                                    within vm_mm. */

    uint64_t vm_flags;      /* Flags as listed above. */
    uint64_t vm_content_offset;
    int have_allocated;
};

/* 线程状态段数据结构 */
struct thread_struct
{
    uint64 ra;
    uint64 sp;
    uint64 s[12];

    uint64_t sepc, sstatus, sscratch;
};

struct task_struct
{
    struct thread_info* thread_info;
    uint64_t state;
    uint64_t counter;
    uint64_t priority;
    uint64_t pid;

    struct thread_struct thread;

    pagetable_t pgd;

    uint64_t vma_cnt;
    struct vm_area_struct vmas[0]; 
};


/* 用于记录线程的内核栈指针、用户栈指针 */
/* (Lab3中无需考虑，在这里引入是为了之后实验的使用) */
struct thread_info
{
    uint64 kernel_sp;
    uint64 user_sp;
};


/* 线程初始化，创建NR_TASKS个线程 */
void task_init();

/* 在时钟中断处理中被调用，用于判断是否需要进行调度 */
void do_timer();

/* 调度程序，选出下一个运行的线程 */
void schedule();

/* 线程切换入口函数*/
void switch_to(struct task_struct* next);

/* dummy funciton: 一个循环程序，循环输出自己的pid以及一个自增的局部变量*/
void dummy();

// 创建一个新的 vma
uint64_t do_mmap(struct task_struct *task, uint64_t addr, uint64_t length, int prot, uint64_t vm_content_offset);

// 查找包含某个 addr 的 vma，该函数主要在 Page Fault 处理时起作用
struct vm_area_struct *find_vma(struct task_struct *task, uint64_t addr);