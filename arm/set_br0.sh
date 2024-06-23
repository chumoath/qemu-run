#!/bin/sh

ifconfig ens33 down # 关闭宿主机网卡接口
brctl addbr br0    # 添加 br0 网桥
brctl addif br0 ens33  # br0 中添加接口
ifconfig br0 up       # 启用 br0
ifconfig ens33 up      
brctl show br0        # 查看虚拟网桥列表
brctl showstp br0     # 查看 br0 的各接口信息


ifconfig br0 192.168.33.145 up

mkfifo monitor.in monitor.out
mkfifo serial.in serial.out
