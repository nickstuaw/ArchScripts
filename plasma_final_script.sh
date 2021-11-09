#!/bin/sh
# =====================================================
# =============        RUN AS USER        =============
# =====================================================

cd ~

# Pacman packages
sudo pacman -S ark kbackup flameshot discord obs-studio code dotnet-runtime dotnet-sdk mono --noconfirm
# Install yay
echo "INSTALLING YAY..."
git clone https://aur.archlinux.org/yay.git
cd yay
echo y | makepkg -si
yay -Syu
echo y | yay -S microsoft-edge-stable-bin --noprovides --noremovemake --answeredit 1 --answerclean N --answerdiff N --save
echo y | yay -S latte-dock intellij-idea-ultimate-edition rider bootstrap-studio
# Install packettracer
git clone https://aur.archlinux.org/packettracer.git
cd packettracer
echo "Log into Cisco Networking Academy and go to\nResources menu > Download packet tracer.\nwnload the .deb file and put it in this directory then build and install the package.\nSee https://wiki.archlinux.org/title/PacketTracer for more details." > touch instructions.txt
