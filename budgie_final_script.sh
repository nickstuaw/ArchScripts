#!/bin/sh
# =====================================================
# =============        RUN AS USER        =============
# =====================================================

cd ~

# Pacman packages
sudo pacman -S discord --noconfirm
# Install yay
bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/yay_user_install.sh)
# Install packages
echo y | yay -S librewolf-bin intellij-idea-ultimate-edition
