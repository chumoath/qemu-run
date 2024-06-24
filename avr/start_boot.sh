#!bin/sh


#gdb -args ../../qemu-8.1.0/build/qemu-system-avr \
#../../qemu-8.1.0/build/qemu-system-avr \
#../../../../qemu-lc3/qemu-8.1.0/build/qemu-system-lc3 \
gdb -args ../../../../qemu-lc3/qemu-8.1.0/build/qemu-system-lc3 \
	-nographic \
	-M lc3-machine \
	-cpu lc3-cpu \
	-bios ./2048.obj \
	-D log.txt \
	-monitor pipe:mon \
	-d in_asm,op,out_asm \
	#-serial mon:stdio \
	#-bios ./firmware/qemu-avr-tests/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf \
	#-plugin ../../qemu-8.1.0/build/contrib/plugins/libexeclog.so \
	#-d plugin \
	#-serial tcp::5678,server=on,wait=off \


	#-s -S
	#-bios ./firmware/blinky.elf \


	# telnet localhost 5678
