obj-m:=tcp_bbr_m.o


all:
	make -C /lib/modules/`uname -r`/build M=`pwd` modules CC=`which gcc`

clean:
	make -C /lib/modules/`uname -r`/build M=`pwd` clean

install:
	install tcp_bbr_m.ko /lib/modules/`uname -r`/kernel/net/ipv4
#	insmod /lib/modules/`uname -r`/kernel/net/ipv4/tcp_nanqinlang.ko
	depmod -a
	modprobe tcp_bbr_m

uninstall:
	rm /lib/modules/`uname -r`/kernel/net/ipv4/tcp_bbr_m.ko
