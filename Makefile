SUBDIRS = kernel bootloader

all: bootloader kernel bin

.PHONY: bootloader
bootloader:
	@list='./bootloader'; for subdir in $$list; do \
		echo "make all in $$subdir";\
		cd $$subdir;\
		$(MAKE) all;\
		cd ..;\
	done

.PHONY: kernel
kernel:
	@list='./kernel'; for subdir in $$list; do \
		echo "make all in $$subdir";\
		cd $$subdir;\
		$(MAKE) all;\
		cd ..;\
	done

.PHONY: bin
bin:
	@list='./bin'; for subdir in $$list; do \
		echo "make all in $$subdir";\
		cd $$subdir;\
		$(MAKE) all;\
		cd ..;\
	done

.PHONY: clean
clean:
	@list='$(SUBDIRS)';for subdir in $$list; do \
		echo "Clean in dir $$subdir"; \
		cd $$subdir; \
		$(MAKE) clean; \
		cd ..; \
	done