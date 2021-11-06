#!/bin/sh
# Written by Nick (https://github.com/nsgwick (https://nsgw.xyz))
# This script includes KDE/Plasma, nvidia and pipewire.
# Use timedatectl to ensure the system clock is accurate: 
timedatectl set-ntp true
# Download database files
pacman -Sy
# Install gparted
pacman -S parted --noconfirm
# Partition for UEFI
parted /dev/sda mklabel gpt
parted /dev/sda mkpart EFI fat32 1MiB 512MiB set 1 esp on mkpart swap linux-swap 512MiB 1024MiB mkpart rootandfs ext4 1536MiB 100%
mkfs.vfat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
mount /dev/sda3 /mnt
# PACKAGES
pacstrap /mnt base base-devel linux-zen linux-firmware nvidia dhcpcd sudo vim git go ufw pipewire pipewire-alsa pipewire-jack pipewire-pulse xorg-server xorg-apps gtk3 sddm sddm-kcm kitty
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/plasma_chroot_script.sh)
umount -R /mnt
reboot
