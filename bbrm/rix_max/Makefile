obj-m:=tcp_rixCloud_max.o


all:
	make -C /lib/modules/`uname -r`/build M=`pwd` modules CC=`which gcc`

clean:
	make -C /lib/modules/`uname -r`/build M=`pwd` clean

install:
	install tcp_bbr_rixCloud_max.ko /lib/modules/`uname -r`/kernel/net/ipv4
#	insmod /lib/modules/`uname -r`/kernel/net/ipv4/tcp_nanqinlang.ko
	depmod -a
	modprobe tcp_rixCloud_max

uninstall:
	rm /lib/modules/`uname -r`/kernel/net/ipv4/tcp_rixCloud_max.ko
