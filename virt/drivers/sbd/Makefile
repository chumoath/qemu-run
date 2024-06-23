KERNELDIR := /home/guoxiaohe/QemuLab/env/linux-5.10.163/build
CURRENT_PATH := $(shell pwd)
CROSS_COMPILE=aarch64-linux-gnu-
ARCH=arm64

# second
#
ifneq ($(KERNELRELEASE),)

obj-m := sbd.o
# chrdevbase-y := 
# chrdevbase-y += 
#
# chrdevbase-objs += 

else


# first
#
all:
	$(MAKE) -C $(KERNELDIR) M=$(CURRENT_PATH) modules
clean:
	$(MAKE) -C $(KERNELDIR) M=$(CURRENT_PATH) clean

endif
