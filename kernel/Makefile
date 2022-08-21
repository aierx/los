CC=gcc

ALL_C = $(wildcard ./*.c)
C_OBJ = $(notdir $(ALL_C))
O_OBJ = ${patsubst %.c,%.o,$(C_OBJ)}

# $@ 目标文件
# $< 第一个依赖文件
# $^ 所有依赖文件
# %.o 表示所有的.o文件
# %.c 表示所有的.c文件

all: system
	objcopy -I elf64-x86-64 -S -R ".eh_frame" -R ".comment" -O binary system kernel.bin
	

system:	$(O_OBJ) head.o
	echo $(O_OBJ)
	ld -b elf64-x86-64 -z muldefs -o system head.o $(O_OBJ) -T Kernel.lds

%.o: %.c
	$(CC) -static -mcmodel=large -fno-builtin -m64 -c $< -fno-stack-protector

head.o:	head.S
 	# 预处理
	$(CC) -E  head.S > head.s
	as --64 -o head.o head.s

clean:
	rm -rf *.o *.s~ *.s *.S~ *.c~ *.h~ system  Makefile~ Kernel.lds~ kernel.bin 