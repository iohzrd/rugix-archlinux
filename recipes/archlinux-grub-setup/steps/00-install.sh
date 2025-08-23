#!/bin/bash

set -euo pipefail

pacman -Syu --noconfirm

BOOT_DIR="${RUGIX_LAYER_DIR}/roots/boot"

# if [ "${RECIPE_PARAM_WITH_SQUASHFS}" == "true" ]; then
#     pacman -Sy --noconfirm squashfs-tools
#     echo "squashfs" > "/usr/share/initramfs-tools/modules.d/rugix"
# fi

mkdir -p "${BOOT_DIR}"

echo "Installing kernel..."
case "${RUGIX_ARCH}" in
    "amd64")
        pacman -S --noconfirm \
            linux-lts \
            efibootmgr \
            grub \
            mkinitcpio
        ;;
    *)
        echo "Unsupported architecture '${RUGIX_ARCH}'."
        exit 1
esac

if [ "${RECIPE_PARAM_WITH_FIRMWARE}" == "true" ]; then
    echo "Installing firmware..."
    pacman -S --noconfirm linux-firmware
fi

echo "Copying kernel and initrd..."
cp -L /boot/vmlinuz-linux-lts "${BOOT_DIR}/vmlinuz"
cp -L /boot/initramfs-linux-lts.img "${BOOT_DIR}/initrd.img"
cp -rp "${RECIPE_DIR}/files/boot/"* "${BOOT_DIR}"
