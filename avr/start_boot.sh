#!bin/sh


#gdb -args ../../qemu-8.1.0/build/qemu-system-avr \
#../../qemu-8.1.0/build/qemu-system-avr \
../../../../qemu-lc3/qemu-8.1.0/build/qemu-system-lc3 \
	-nographic \
	-M mega2560 \
	-bios ./firmware/qemu-avr-tests/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf \
	-s \
	-D log.txt \
	-monitor pipe:mon \
	-serial mon:stdio \
	-d in_asm,op,out_asm \
	#-plugin ../../qemu-8.1.0/build/contrib/plugins/libexeclog.so \
	#-d plugin \
	#-serial tcp::5678,server=on,wait=off \


	#-s -S
	#-bios ./firmware/blinky.elf \


	# telnet localhost 5678
