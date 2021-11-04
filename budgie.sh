#!/bin/sh
function chrootScript() {
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
  echo -n "Choose a username: " && read uname && useradd -m -G wheel $uname
  echo "Set the password for $uname." && passwd $uname
  # Install GRUB bootloader
  mkdir efi
  mount /dev/sda1 /efi
  pacman -S grub efibootmgr amd-ucode --noconfirm
  grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
  grub-mkconfig -o /boot/grub/grub.cfg
  # Download wallpaper
  curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/archlinux.jpg > /usr/share/backgrounds/budgie/default.jpg
  # Enable dynamic IP usage
  dhcpcd -k
  dhcpcd
  # Enable what needs to be enabled
  systemctl enable dhcpcd gdm
}
# Written by Nick (https://github.com/nsgwick (https://nsgw.xyz))
# This script includes GDM, budgie-desktop, and pipewire.
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
# PACKAGES
pacstrap /mnt base linux-zen linux-firmware dhcpcd sudo vim ufw nvidia pipewire pipewire-alsa pipewire-jack pipewire-pulse xorg-server xorg-apps gdm budgie-desktop budgie-screensaver gnome-shell gnome-tweaks gnome-control-center kitty
echo "Installed zen kernel and linux firmware."
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt chrootScript
umount -R /mnt
reboot
