#!bin/sh


#-serial pipe:serial \
#-M virt,dumpdtb=virt.dtb \
# -net nic,model=e1000,netdev=eth0 \
# -netdev tap,ifname=tap0,id=eth0,script=./qemu-ifup,downscript=./qemu-ifdown \

#../../qemu-8.1.0/build/qemu-system-aarch64 \
gdb -args ../../qemu-8.1.0/build/qemu-system-aarch64 \
	-M virt \
	-cpu cortex-a55 \
	-smp 4 \
	-m 4096M \
	-nographic \
	-kernel ../../linux-5.10.163/build/arch/arm64/boot/Image \
	-initrd ../../busybox-1.30.0/build/initrd_boot.cpio.gz \
	-dtb virt.dtb \
	-append "root=/dev/ram0 console=ttyAMA0 init=/linuxrc ignore_loglevel nokaslr" \
	-netdev tap,ifname=tap1,id=eth1,script=./qemu-ifup,downscript=./qemu-ifdown \
	-net nic,model=smc91c111,netdev=eth1 \
	-chardev pipe,id=serial,path=serial \
	-qmp unix:./qmp-sock,server,nowait \
	-drive file=emmc.img,if=sd,format=raw \
	-chardev pipe,id=monitor,path=monitor \
	-d in_asm,op,out_asm \
	-D log.txt \
	-monitor pipe:monitor \
	-serial pipe:serial \
	-s
	#-d plugin \
	# -S 
	#-serial mon:stdio \

	#-netdev tap,ifname=tap3,id=net0,script=./qemu-ifup,downscript=./qemu-ifdown \
	#-device e1000,netdev=net0 \
	#-S -s
	#-bios ../../u-boot-master/build/u-boot.bin \
	#-kernel ../../linux-5.10.163/build/uImage \
	#-net nic,model=e1000,netdev=eth2 \
	#-netdev tap,ifname=tap2,id=eth2,script=./qemu-ifup,downscript=./qemu-ifdown \
	#-monitor pipe:monitor \
#	-S -s
	#-plugin ../../qemu-8.1.0/build/contrib/plugins/liblockstep.so \
        #-s -S 
	#-D log.txt \
	#-d op,trace:pl011_write	\
	#-plugin ../../qemu-8.1.0/build/tests/plugin/libinsn.so \
	#-plugin ../../qemu-8.1.0/build/tests/plugin/libsyscall.so \
	#-plugin ../../qemu-8.1.0/build/tests/plugin/libbb.so \
	#-plugin ../../qemu-8.1.0/build/tests/plugin/libempty.so \
	#-plugin ../../qemu-8.1.0/build/contrib/plugins/libcache.so \
	#-plugin ../../qemu-8.1.0/build/contrib/plugins/libexeclog.so \
	#-plugin ../../qemu-8.1.0/build/contrib/plugins/libhotpages.so \
	#-plugin ../../qemu-8.1.0/build/contrib/plugins/libhwprofile.so \
	#-plugin ../../qemu-8.1.0/build/contrib/plugins/libdrcov.so \
	#-plugin ../../qemu-8.1.0/build/contrib/plugins/libhotblocks.so \
	#-plugin ../../qemu-8.1.0/build/contrib/plugins/libhowvec.so \
