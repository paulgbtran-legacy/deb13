#!/bin/bash

# setup.sh
# Author: Paul Tran <home.paulgbtran@gmail.com> 
# For personal use only!
# This is a script for quick setup on new installations,
# tailored to my personal use cases.

# Removes Debian's preinstalled bloatware
sudo apt purge $(cat bloat.list)
sudo apt autoremove
sudo apt clean

# Installs packages from Debian repositories
sudo apt install $(cat packages.list)

# Sets up clamav
sudo apt install clamav clamav-daemon clamav-freshclam clamdscan 
                        # In case packages.list doesn't have these

# Copies config files to clamav's location
sudo cp ./clamav/clamd.conf /etc/clamav/clamd.conf
sudo cp ./clamav/clamav /etc/sudoers.d/clamav
sudo cp ./clamav/virus-event.bash /etc/clamav/virus-event.bash
sudo cp ./clamav/clamav-milter.conf /etc/clamav/clamav-milter.conf

