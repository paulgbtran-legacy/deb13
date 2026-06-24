#!/bin/bash

# Set up Flathub
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
sudo apt install plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Reboot needed to finish setup.