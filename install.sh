#!/usr/bin/env bash
# >>>>>>>>>>>>>>>>>>>>>>>> HEADER >>>>>>>>>>>>>>>>>>>>>>>>
# Nome      : install.sh
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

# Verifica se os comandos necessários já estão instalados e instala eles, caso
# necessário.
for command_dependency in "${COMMANDS_DEPENDENCIES[@]}"; do
    if [ ! "$(command -v "$command_dependency")" ]; then
        sudo apt-get install "$command_dependency" -y
    fi
done

# Verifica se o diretório tmp existe na raiz do projeto e cria ele, caso
# necessário.
if [ ! -d "./tmp" ]; then
    mkdir ./tmp
fi
