#!/bin/bash

# python.sh
# Author: Paul Tran <home.paulgbtran@gmail.com>
# For personal use only!
# This is a shell script to install my Flathub packages

flatpak install flathub $(cat flathub.list)
echo -e 'Setup completed.'