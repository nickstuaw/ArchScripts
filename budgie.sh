#!/bin/sh
# Written by Nick (https://github.com/nsgwick (https://nsgw.xyz))
# This script includes GDM, budgie-desktop, and pipewire.
# Use timedatectl to ensure the system clock is accurate: 
timedatectl set-ntp true
# Download database files
pacman -Sy
# Install gparted
pacman -S parted --noconfirm
# Partition for UEFI
parted /dev/nvme1n1 mklabel gpt
parted /dev/nvme1n1 mkpart EFI fat32 1MiB 512MiB set 1 esp on mkpart swap linux-swap 512MiB 1024MiB mkpart rootandfs ext4 1536MiB 100%
mkfs.vfat -F 32 /dev/sda1
mkswap /dev/nvme1n1p2
mkfs.ext4 /dev/nvme1n1p3
mount /dev/nvme1n1p3 /mnt
# PACKAGES
pacstrap /mnt base base-devel linux-zen linux-firmware dhcpcd sudo vim ufw nvidia pipewire pipewire-alsa pipewire-jack pipewire-pulse xorg-server xorg-apps gdm budgie-desktop budgie-screensaver gnome-shell gnome-tweaks gnome-control-center kitty
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/budgie_chroot_script.sh)
umount -R /mnt
reboot
