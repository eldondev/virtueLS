INITRD_FILES:= $(shell find root)

initrd.gz: initrd
	  gzip -fk initrd	

initrd: $(INITRD_FILES) root/bin/busybox
	   cd root && find . | cpio --verbose -o -H newc -O ../initrd

root/bin/busybox: $(shell which busybox)
	cp -iv $(shell which busybox) root/bin/busybox
