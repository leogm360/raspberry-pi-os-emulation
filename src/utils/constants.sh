#!/usr/bin/env bash

# Versão oficial do raspberry pi os lite.
export RASPBERRY_PI_OS_LITE='https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2023-02-22/2023-02-21-raspios-bullseye-armhf-lite.img.xz'

# Kernel QEMU compilado para debian bullseye.
export QEMU_RPI_KERNEL='https://raw.githubusercontent.com/dhruvvyas90/qemu-rpi-kernel/master/versatile-pb-bullseye-5.10.63.dtb'

# Dtb do kernel compilado.
export QEMU_RPI_KERNEL_DTB='https://raw.githubusercontent.com/dhruvvyas90/qemu-rpi-kernel/master/kernel-qemu-5.10.63-bullseye'

# Dependencias do script.
export DEPENDENCIES=(
    'lib32z1'
    'libc6-i386'
    'curl'
    'xz-utils'
    'qemu-system-x86'
)
