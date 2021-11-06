#!/bin/sh
# =====================================================
# =============        RUN AS USER        =============
# =====================================================

cd ~

# Pacman packages
sudo pacman -S ark kbackup
sudo pacman -S flameshot
# Install yay
echo "INSTALLING YAY..."
git clone https://aur.archlinux.org/yay.git
cd yay
echo y | makepkg -si
yay -Syu
echo y | yay -S microsoft-edge-stable-bin --noprovides --noremovemake --answeredit 1 --answerclean N --answerdiff N --save
echo y | yay -S latte-dock
