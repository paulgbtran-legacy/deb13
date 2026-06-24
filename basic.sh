#!/bin/bash
# BASIC APP INSTALL

# Perform updates before setting up new packages.
sudo apt update && sudo apt upgrade

# Remove Debian's preinstalled bloatware
sudo apt purge $(cat ../bloat.list)
sudo apt autoremove
sudo apt clean

# Install packages from Debian repositories
sudo apt install $(cat ../packages.list)

# Install fonts to system
sudo cp ./fonts/* /usr/share/fonts/