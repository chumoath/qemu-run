#!bin/sh


#-serial pipe:serial \
#-M virt,dumpdtb=virt.dtb \
# -net nic,model=e1000,netdev=eth0 \
# -netdev tap,ifname=tap0,id=eth0,script=./qemu-ifup,downscript=./qemu-ifdown \

#gdb -args ./qemu-8.1.0/build/qemu-system-aarch64 \
../../qemu-8.1.0/build/qemu-system-arm \
	-M virt \
	-m 512M \
	-nographic \
	-kernel ../../linux-5.10.163/build.arm/arch/arm/boot/zImage \
	-append "root=/dev/ram0 console=ttyAMA0 init=/linuxrc ignore_loglevel nokaslr" \
	-s -S
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
