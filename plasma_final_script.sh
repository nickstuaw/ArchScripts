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
makepkg -si
yay -Syu
yay -S microsoft-edge-stable-bin --noprovides --noremovemake --answeredit 1 --answerclean N --answerdiff N --save
yay -S latte-dock
