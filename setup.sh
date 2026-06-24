#!/bin/bash

# setup.sh
# Author: Paul Tran <home.paulgbtran@gmail.com> 
# For personal use only!
# This is a script for quick setup on new installations,
# tailored to my personal use cases.
# Be sure to update at least once a month.

sudo -v

sudo bash $(cat install.list)

# Displays completion message.
echo
echo
echo 'Setup completed. The system will reboot in a minute.'
echo 'To install Python packages, run python.sh. Otherwise, restart and run flathub.sh to install Flathub packages.'

# Reboot to finish setup.
sudo sleep 60
sudo reboot now
