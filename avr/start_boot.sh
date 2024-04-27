#!bin/sh


gdb -args ../../qemu-8.1.0/build/qemu-system-avr \
	-nographic \
	-M mega2560 \
	-bios ./firmware/qemu-avr-tests/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf \
	-s \
	-serial tcp::5678,server=on,wait=off \

	#-D log.txt \
	#-d in_asm

	#-s -S
	#-bios ./firmware/blinky.elf \


	# telnet localhost 5678
