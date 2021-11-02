#!/bin/sh
# Written by Nick (https://github.com/nsgwick (https://nsgw.xyz))
echo "Chrooted into the new system."
echo "Created efi mount point."
# Set the local timezone
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
# Generate the locale
locale-gen
localectl set-locale LANG=en_GB.UTF-8
echo "Time and language set."
# Set system details
echo -n "Choose a device name (hostname): " && read && echo $REPLY > /etc/hostname
echo "Set the root password." && passwd
# Install GRUB bootloader
mkdir efi
mount /dev/sda1 /efi
pacman -S grub efibootmgr amd-ucode --noconfirm
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
# Download wallpaper
curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/archlinux.png > /usr/share/backgrounds/budgie/default.png
# Enable dynamic IP usage
dhcpcd -k
dhcpcd
systemctl enable dhcpcd
