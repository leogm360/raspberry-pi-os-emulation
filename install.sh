#!/usr/bin/env bash
# >>>>>>>>>>>>>>>>>>>>>>>> HEADER >>>>>>>>>>>>>>>>>>>>>>>>
# Nome      : emulate.sh
# Site      : https://github.com/leogm360/raspberry-pi-os-emulation
# Autor     : Leonardo Moraes <leogm360@gmail.com>
# Manutenção: Leonardo Moraes <leogm360@gmail.com>
#
# -------------------------------------------------------------
# Prepara e emula a versão mais atual do sistema operacional
# Raspberry Pi OS Lite.
#
# Exemplos:
#
# $ git clone git@github.com:leogm360/raspberry-pi-os-emulation.git
# $ cd raspberry-pi-os-emulation
# $ chmod +x ./install.sh
# $ ./install.sh
#
# -------------------------------------------------------------
# Histórico:
#
# v1.0.0 2023-04-10, Leonardo Moraes:
# - Cria primeira versão do script.
#
# --------------------------------------------------------------
# Licença:
#
# - MIT
#
# <<<<<<<<<<<<<<<<<<<<<<<< HEADER <<<<<<<<<<<<<<<<<<<<<<<<

# Carrega as constantes:
# - RASPBERRY_PI_OS_LITE_REPOSITORY;
# - IMAGE_RELEASE_PATTERN;
# - COMMANDS_DEPENDENCIES.
source './src/utils/constants.sh'

# Instala as dependências necessárias

echo -e "\nChecking for dependencies"

for dep in "${DEPENDENCIES[@]}"; do
    sudo apt-get install "$dep" -y
done

echo -e "\nCrecating dist\n"

# Verifica se o diretório dist existe e cria ele, caso
# necessário.
if [ ! -d "./dist" ]; then
    mkdir ./dist
fi

echo -e "\nDownloading Raspberry Pi OS\n"

curl -LO --output-dir ./dist "$RASPBERRY_PI_OS_LITE"

echo -e "\nDownloading QEMU Kernel\n"

curl -LO --output-dir ./dist "$QEMU_RPI_KERNEL"

echo -e "\nDownloading QEMU DTB\n"

curl -LO --output-dir ./dist "$QEMU_RPI_KERNEL_DTB"

echo -e "\nUnpacking\n"

xz -dkv ./dist/*.img.xz
