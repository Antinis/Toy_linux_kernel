#include "types.h"
#include "trap.h"

void handler_interrupt(uint64 scause, uint64 sepc, struct pt_regs *regs);
void clock_set_next_event();