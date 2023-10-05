export
CROSS_=riscv64-unknown-elf-
GCC=${CROSS_}gcc			# 编译器
LD=${CROSS_}ld				# 连接器
OBJCOPY=${CROSS_}objcopy

ISA=rv64imafd	# 硬件平台，带数学、浮点、双精度扩展的riscv64
ABI=lp64

INCLUDE = -I $(shell pwd)/include -I $(shell pwd)/arch/riscv/include	# 包含.h文件
CF = -march=$(ISA) -mabi=$(ABI) -mcmodel=medany -fno-builtin -ffunction-sections -fdata-sections -nostartfiles -nostdlib -nostdinc -static -lgcc -Wl,--nmagic -Wl,--gc-sections -g # 编译选项
CFLAG = ${CF} ${INCLUDE} -D DSJF	# 给编译选项再添加上指定头文件的位置

.PHONY:all run debug clean
all:
	${MAKE} -C lib all				# 编译lib路径下的文件
	${MAKE} -C init all				# 编译init路径下的文件
	${MAKE} -C user all				# 编译init路径下的文件
	${MAKE} -C arch/riscv all		# 编译arch/riscv路径下的文件
	@echo -e '\n'Build Finished OK

run: all
	@echo Launch the qemu ......
	@qemu-system-riscv64 -nographic -machine virt -kernel vmlinux -bios default 

debug: all
	@echo Launch the qemu for debug ......
	@qemu-system-riscv64 -nographic -machine virt -kernel vmlinux -bios default -S -s

clean:
	${MAKE} -C lib clean
	${MAKE} -C init clean
	${MAKE} -C user clean
	${MAKE} -C arch/riscv clean
	$(shell test -f vmlinux && rm vmlinux)
	$(shell test -f System.map && rm System.map)
	@echo -e '\n'Clean Finished
