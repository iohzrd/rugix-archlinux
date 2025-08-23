#!/bin/bash

set -euo pipefail

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

BOOT_DIR="${RUGIX_LAYER_DIR}/roots/boot"

pacman -Syy
pacman --noconfirm -S archlinuxarm-keyring

if [ "${RECIPE_PARAM_WITH_FIRMWARE}" == "true" ]; then
    echo "Installing firmware..."
    pacman --noconfirm -S \
        linux-firmware \
        wireless-regdb
fi

pacman --noconfirm -S \
    firmware-raspberrypi \
    linux-rpi \
    linux-rpi-headers \
    raspberrypi-bootloader

mkdir -p "${BOOT_DIR}"

cp -rp /boot/* "${BOOT_DIR}"
cp -rp "${RECIPE_DIR}/files/boot/"* "${BOOT_DIR}"
