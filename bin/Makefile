# umount /media/
all: boot.img
	dd if=../bootloader/boot.bin of=boot.img bs=512 count=1 conv=notrunc
	umount /media/
	mount boot.img /media/ -t vfat -o loop
	cp ../bootloader/loader.bin /media/
	cp ../kernel/kernel.bin /media/
	sync
	umount /media/
	bochs

boot.img:
	bash create_image.sh

clean:
	rm -fr *.img