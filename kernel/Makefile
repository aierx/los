CC=gcc

ALL_C = $(wildcard ./*.c)
C_OBJ = $(notdir $(ALL_C))
O_OBJ = ${patsubst %.c,%.o,$(C_OBJ)}

# $@ 目标文件
# $< 第一个依赖文件
# $^ 所有依赖文件

# all: system
# 	objcopy -I elf64-x86-64 -S -R ".eh_frame" -R ".comment" -O binary system kernel.bin
	

# system:	$(O_OBJ) head.o
# 	ld -b elf64-x86-64 -z muldefs -o system head.o $(O_OBJ) -T Kernel.lds

# $(O_OBJ): $(C_OBJ)
# 	$(CC) -static -mcmodel=large -fno-builtin -m64 -c $< -o $@ -fno-stack-protector

# head.o:	head.S
# 	$(CC) -E  head.S > head.s # 预处理
# 	as --64 -o head.o head.s

# clean:
# 	rm -rf *.o *.s~ *.s *.S~ *.c~ *.h~ system  Makefile~ Kernel.lds~ kernel.bin 


all: system
	objcopy -I elf64-x86-64 -S -R ".eh_frame" -R ".comment" -O binary system kernel.bin

system:	head.o main.o printk.o
	ld -b elf64-x86-64 -z muldefs -o system head.o main.o printk.o -T Kernel.lds 

head.o:	head.S
	gcc -E  head.S > head.s
	as --64 -o head.o head.s
	
main.o:	main.c lib.h
	gcc -static  -mcmodel=large -fno-builtin -m64 -c main.c  -fno-stack-protector
	
printk.o: printk.c lib.h
	gcc -static  -mcmodel=large -fno-builtin -m64 -c printk.c -fno-stack-protector

clean:
	rm -rf *.o *.s~ *.s *.S~ *.c~ *.h~ system  Makefile~ Kernel.lds~ kernel.bin 