#!/bin/sh
# =====================================================
# =============        RUN AS USER        =============
# =====================================================
# Example usage:
#   su -c "bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/yay_user_install.sh)" $uname
# where $uname is the username of the sudoer.
#
# Install yay
echo "INSTALLING YAY..."
git clone https://aur.archlinux.org/yay.git
cd yay
echo y | makepkg -si
yay -Syu
