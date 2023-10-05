#define TRAP_MASK (1UL<<63)
#define STI 5
#define ECALL_FROM_U_MODE 8
#define INSTRUCTION_PAGE_FAULT 12
#define LOAD_PAGE_FAULT 13
#define STORE_AMO_PAGE_FAULT 15

typedef unsigned long uint64_t;

struct pt_regs
{
    uint64_t reg[31];
    uint64_t sepc, sstatus, sscratch;
};