#!/bin/bash

set -euo pipefail

pacman -Syy

CONFIG_DIR="${RUGIX_LAYER_DIR}/roots/config"

RPI_EEPROM_DIGEST="/usr/bin/rpi-eeprom-digest"

PI_FIRMWARE="/usr/lib/firmware/raspberrypi/bootloader/default"

mkdir -p "${CONFIG_DIR}"

pacman -Syy

case "${RECIPE_PARAM_MODEL}" in
    "pi4")
        pacman -S --noconfirm rpi4-eeprom
        cp -f "${PI_FIRMWARE}/pieeprom-2025-05-08.bin" "${CONFIG_DIR}/pieeprom.upd"
        ${RPI_EEPROM_DIGEST} -i "${CONFIG_DIR}/pieeprom.upd" -o "${CONFIG_DIR}/pieeprom.sig"
        cp -f "${PI_FIRMWARE}/vl805-000138c0.bin" "${CONFIG_DIR}/vl805.bin"
        ${RPI_EEPROM_DIGEST} -i "${CONFIG_DIR}/vl805.bin" -o "${CONFIG_DIR}/vl805.sig"
        cp -f "${PI_FIRMWARE}/recovery.bin" "${CONFIG_DIR}/recovery.bin"
        ;;
    "pi5")
        pacman -S --noconfirm rpi5-eeprom
        cp -f "${PI_FIRMWARE}/pieeprom-2025-05-08.bin" "${CONFIG_DIR}/pieeprom.upd"
        ${RPI_EEPROM_DIGEST} -i "${CONFIG_DIR}/pieeprom.upd" -o "${CONFIG_DIR}/pieeprom.sig"
        cp -f "${PI_FIRMWARE}/recovery.bin" "${CONFIG_DIR}/recovery.bin"
        ;;
    *)
        echo "Error: Invalid Raspberry Pi model '${RECIPE_PARAM_MODEL}'."
        exit 1
        ;;
esac
