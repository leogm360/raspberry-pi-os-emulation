#!/usr/bin/env bash

echo -e "\nSystem boot\n"

qemu-system-arm \
    -kernel ./dist/kernel-qemu-5.10.63-bullseye \
    -cpu arm1176 \
    -m 256 \
    -M versatilepb \
    -no-reboot \
    -display gtk \
    -serial stdio \
    -dtb ./dist/versatile-pb-bullseye-5.10.63.dtb \
    -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw init=/bin/bash" \
    -drive file=./dist/prod_suflex_rasp_V2_10_04_2023.img,format=raw
