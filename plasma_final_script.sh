#!/bin/sh
# =====================================================
# =============        RUN AS USER        =============
# =====================================================

cd ~

# Pacman packages
sudo pacman -S ark kbackup flameshot discord obs-studio code --noconfirm
# Install yay
bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/yay_user_install.sh)
# Install packages
echo y | yay -S microsoft-edge-stable-bin --noprovides --noremovemake --answeredit 1 --answerclean N --answerdiff N --save
echo y | yay -S latte-dock discord intellij-idea-ultimate-edition rider bootstrap-studio
