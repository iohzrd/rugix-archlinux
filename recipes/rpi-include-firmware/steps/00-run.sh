#!/bin/bash

set -euo pipefail

echo "TODO..."

# pacman -Syy

# CONFIG_DIR="${RUGIX_LAYER_DIR}/roots/config"

# RPI_EEPROM_DIGEST="/usr/share/rugix/rpi-eeprom/rpi-eeprom-digest"

# PI4_FIRMWARE="/usr/share/rugix/rpi-eeprom/firmware-2711"
# PI5_FIRMWARE="/usr/share/rugix/rpi-eeprom/firmware-2712"

# mkdir -p "${CONFIG_DIR}"

# case "${RECIPE_PARAM_MODEL}" in
#     "pi4")
#         pacman -Syu --noconfirm rpi4-eeprom
#         cp -f "${PI4_FIRMWARE}/old/stable/pieeprom-2023-05-11.bin" "${CONFIG_DIR}/pieeprom.upd"
#         ${RPI_EEPROM_DIGEST} -i "${CONFIG_DIR}/pieeprom.upd" -o "${CONFIG_DIR}/pieeprom.sig"
#         cp -f "${PI4_FIRMWARE}/stable/vl805-000138c0.bin" "${CONFIG_DIR}/vl805.bin"
#         ${RPI_EEPROM_DIGEST} -i "${CONFIG_DIR}/vl805.bin" -o "${CONFIG_DIR}/vl805.sig"
#         cp -f "${PI4_FIRMWARE}/stable/recovery.bin" "${CONFIG_DIR}/recovery.bin"
#         ;;
#     "pi5")
#         pacman -Syu --noconfirm rpi5-eeprom
#         cp -f "${PI5_FIRMWARE}/old/default/pieeprom-2023-10-30.bin" "${CONFIG_DIR}/pieeprom.upd"
#         ${RPI_EEPROM_DIGEST} -i "${CONFIG_DIR}/pieeprom.upd" -o "${CONFIG_DIR}/pieeprom.sig"
#         cp -f "${PI5_FIRMWARE}/stable/recovery.bin" "${CONFIG_DIR}/recovery.bin"
#         ;;
#     *)
#         echo "Error: Invalid Raspberry Pi model '${RECIPE_PARAM_MODEL}'."
#         exit 1
#         ;;
# esac
