#!/bin/sh

qemu-system-x86_64 -enable-kvm -cpu host \
		   -net user,hostfwd=tcp::10022-:22 -net nic \
		   -nographic -monitor none -serial none \
		   -m $RAM image.img

#ssh polina@localhost -p 10022
