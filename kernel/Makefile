CC=gcc

ALL_C = $(wildcard ./*.c)
C_OBJ = $(notdir $(ALL_C))
O_OBJ = ${patsubst %.c,%.o,$(C_OBJ)}

# $@ 目标文件
# $< 第一个依赖文件
# $^ 所有依赖文件

all: system
	objcopy -I elf64-x86-64 -S -R ".eh_frame" -R ".comment" -O binary system kernel.bin
	

system:	$(O_OBJ) head.o
	ld -b elf64-x86-64 -o system head.o $(O_OBJ) -T Kernel.lds

$(O_OBJ): $(C_OBJ)
	$(CC) -mcmodel=large -fno-builtin -m64 -c $^ -o $@

head.o:	head.S
	$(CC) -E  head.S > head.s # 预处理
	as --64 -o head.o head.s

clean:
	rm -rf *.o *.s~ *.s *.S~ *.c~ *.h~ system  Makefile~ Kernel.lds~ kernel.bin 