#!/bin/bash

qemu-system-x86_64 -enable-kvm -cpu host -m $RAM -net user,hostfwd=tcp::10022-:22 -net nic -nographic -monitor none -serial none image.img

#ssh polina@localhost -p 10022
