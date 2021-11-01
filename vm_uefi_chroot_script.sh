echo "Chrooted into the new system."
mkdir efi
echo "Created efi mount point."
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
locale-gen
localectl set-locale LANG=en_GB.UTF-8
echo "Time and language set."
echo -n "Choose a device name (hostname): " && read && echo $REPLY > /etc/hostname
echo "Set the root password." && passwd
mount /dev/sda1 /efi
pacman -S grub efibootmgr amd-ucode --noconfirm
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
