#!bin/sh


#-serial pipe:serial \
#-M virt,dumpdtb=virt.dtb \
# -net nic,model=e1000,netdev=eth0 \
# -netdev tap,ifname=tap0,id=eth0,script=./qemu-ifup,downscript=./qemu-ifdown \

#gdb -args ./qemu-8.1.0/build/qemu-system-aarch64 \
../qemu-8.1.0/build/qemu-system-aarch64 \
	-M virt \
	-cpu cortex-a53 \
	-smp 4 \
	-m 4096M \
	-nographic \
	-kernel ../linux-5.10.163/build/arch/arm64/boot/Image.gz \
	-initrd ../busybox-1.30.0/build/initrd_boot.cpio.gz \
	-dtb virt.dtb \
	-append "root=/dev/ram0 console=ttyAMA0 init=/linuxrc ignore_loglevel nokaslr" \
	-netdev tap,ifname=tap1,id=eth1,script=./qemu-ifup,downscript=./qemu-ifdown \
	-net nic,model=smc91c111,netdev=eth1 \
	-monitor pipe:monitor \
	-chardev pipe,id=monitor,path=monitor \
	-chardev pipe,id=serial,path=serial \
	-serial mon:stdio \
	-D log.txt \
	-d op,trace:pl011_write	\
	-qmp unix:./qmp-sock,server,nowait \
	-drive file=emmc.img,if=sd,format=raw \
	-s
        # -s -S 
