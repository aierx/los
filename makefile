all:boot.img boot.bin loader.bin
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
	mount boot.img /media/ -t vfat -o loop
	cp loader.bin /media/
	sync
	umount /media/
	bochs
boot.img:
	bash create_image.sh
boot.bin:
	nasm boot.asm -o boot.bin
loader.bin:
	nasm loader.asm -o loader.bin
.PHONY: clean
clean:
	rm -fr *.img *.bin
