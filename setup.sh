#!/bin/bash

# setup.sh
# Author: Paul Tran <home.paulgbtran@gmail.com> 
# For personal use only!
# This is a script for quick setup on new installations,
# tailored to my personal use cases.
# Be sure to update at least once a month.

# Perform updates before setting up new packages.
sudo apt update && sudo apt upgrade

# Remove Debian's preinstalled bloatware
sudo apt purge $(cat bloat.list)
sudo apt autoremove
sudo apt clean

# Install packages from Debian repositories
sudo apt install $(cat packages.list)

# Set up clamav
sudo apt install clamav clamav-daemon clamav-freshclam clamdscan 
                        # In case packages.list doesn't have these

# Copy config files to clamav's location
sudo cp ./clamav/clamd.conf /etc/clamav/clamd.conf
sudo cp ./clamav/clamav /etc/sudoers.d/clamav
sudo cp ./clamav/virus-event.bash /etc/clamav/virus-event.bash
sudo cp ./clamav/clamav-milter.conf /etc/clamav/clamav-milter.conf
sudo cp ./clamav/clamav-milter.service /etc/systemd/system/clamav-milter.service
cat ./clamav/clamav-clamonacc.service | sudo systemctl edit clamav-clamonacc.service
# Start all clamav services
sudo systemctl start clamav-clamonacc.service && sudo systemctl enable clamav-clamonacc.service
sudo systemctl start clamav-daemon.service && sudo systemctl enable clamav-daemon.service
sudo systemctl start clamav-freshclam.service && sudo systemctl enable clamav-freshclam.service
sudo systemctl start clamav-freshclam-once.timer && sudo systemctl enable clamav-freshclam-once.timer
sudo systemctl enable clamav-milter.service

# Setup ufw
sudo systemctl start ufw.service
sudo systemctl enable ufw.service
sudo ufw default deny
sudo ufw enable

# Setup rkhunter
sudo rkhunter --propupd

# Install ProtonVPN
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
echo "0b14e71586b22e498eb20926c48c7b434b751149b1f2af9902ef1cfe6b03e180 protonvpn-stable-release_1.0.8_all.deb" | sha256sum --check -
sudo apt install proton-vpn-gnome-desktop
sudo apt install libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator # For GNOME installs only

# Install and enable CloudFlare WARP
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt-get update && sudo apt-get install cloudflare-warp
warp-cli registration new
warp-cli connect

# Install Microsoft Edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-stable.list'
sudo rm microsoft.gpg
sudo apt update && sudo apt install microsoft-edge-stable

# Install Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/keyrings/microsoft-archive-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code

# rm -rf ./
