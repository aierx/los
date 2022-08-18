all:boot.img boot.bin
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
	rm -fr boot.bin
	bochs
boot.img:
	bash create_image.sh
boot.bin:
	nasm boot.asm -o boot.bin
.PHONY: clean
clean:
	rm -fr *.img *.bin
