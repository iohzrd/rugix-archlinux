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

mkdir -p /boot/efi
export SYSTEMD_RELAX_ESP_CHECKS=1
export SYSTEMD_RELAX_XBOOTLDR_CHECKS=1
# bootctl install --esp-path=/boot/efi --boot-path=/boot
bootctl update

# echo "Copying kernel and initrd..."
cp -rp /boot/* "${BOOT_DIR}"
cp -rp "${RECIPE_DIR}/files/boot/"* "${BOOT_DIR}"
ls "${BOOT_DIR}"
sleep 30