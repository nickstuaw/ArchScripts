#!/bin/sh
# Written by Nick (https://github.com/nsgwick (https://nsgw.xyz))
# Use timedatectl to ensure the system clock is accurate: 
timedatectl set-ntp true
echo "Using time datectl."
# Download database files
pacman -Sy
echo "Downloaded database files."
# Install gparted
pacman -S parted --noconfirm
echo "Intalled gparted."
# Partition for UEFI
parted /dev/sda mklabel gpt
echo "Created a GPT table."
parted /dev/sda mkpart EFI fat32 1MiB 512MiB set 1 esp on mkpart swap linux-swap 512MiB 1024MiB mkpart rootandfs ext4 1536MiB 100%
mkfs.vfat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
mount /dev/sda3 /mnt
echo "Mounted the filesystem."
pacstrap /mnt base linux-zen linux-firmware dhcpcd vim
echo "Installed zen kernel and linux firmware."
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/vm_uefi_chroot_script.sh)
umount -R /mnt
reboot

