#!/bin/bash

# Install Steam (amd64)
sudo apt purge xserver-xorg-video-intel && sudo apt autoremove && sudo apt clean
sudo dpkg --add-architecture i386
sudo echo "" >> /etc/apt/sources.list
sudo echo "# Steam" >> /etc/apt/sources.list
sudo echo "deb http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware" >> /etc/apt/sources.list
sudo apt update && sudo apt install steam-installer
sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386

