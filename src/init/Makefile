C_SRC       = $(sort $(wildcard *.c))	# 搜索本层目录底下所有的C
OBJ		    = $(patsubst %.c,%.o,$(C_SRC))	# 字符串替换，将.c全部替换成.o

file = main.o
all:$(OBJ)	# 自动依赖探测
	
%.o:%.c
	${GCC} ${CFLAG} -c $<
clean:
	$(shell rm *.o 2>/dev/null)
