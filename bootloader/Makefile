
.PHONY: all
all: boot.bin loader.bin

boot.bin:
	nasm boot.asm -o boot.bin
loader.bin:
	nasm loader.asm -o loader.bin

.PHONY: clean
clean:
	rm -fr *.bin