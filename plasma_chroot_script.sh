#!/bin/sh
# Written by Nick (https://github.com/nsgwick (https://nsgw.xyz))
echo "Chrooted into the new system."
# Set the local timezone
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
# Generate the locale
locale-gen
localectl set-locale LANG=en_GB.UTF-8
# Set system details
echo -n "Choose a device name (hostname): " && read && echo $REPLY > /etc/hostname
echo "Set the root password." && passwd
echo -n "Choose a username: " && read uname && useradd -m -G wheel $uname
echo "Set the password for $uname." && passwd $uname
echo "%wheel ALL=(ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)
# Install GRUB bootloader
mkdir efi
mount /dev/sda1 /efi
pacman -S grub efibootmgr amd-ucode --noconfirm
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
#to-do: Download wallpaper
#curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/archlinux.jpg > /usr/share/backgrounds/budgie/default.jpg
# Prepare pacman
pacman -Syu
# Download packages
pacman -S plasma-desktop konsole yakuake --noconfirm --needed
# Enable dynamic IP usage
dhcpcd -k
dhcpcd
# Enable what needs to be enabled
systemctl enable dhcpcd lightdm
# Install Yay
echo "INSTALLING YAY..."
git clone https://aur.archlinux.org/yay.git && chown -R $uname yay
su -c "cd yay && makepkg -si" $uname
