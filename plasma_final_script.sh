#!/bin/sh
# =====================================================
# =============        RUN AS USER        =============
# =====================================================

cd ~

# Install yay
echo "INSTALLING YAY..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay
