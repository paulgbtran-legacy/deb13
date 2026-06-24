# deb13
**Author:** Paul Tran <paulgbtran@gmail.com>, for personal use only.

A quick setup tool for Debian 13, containing all the stuff that I would need for daily use.

# How to use
- Customize what apps from Debian's apt repository to install by modifying `packages.list`.
- Customize what non-apt apps to install by modifying `install.list` (if adding apps, make sure corresponding scripts are made).
- Start basic installation by running `setup.sh`.
- Customize what Python libs to install using `python.list` and use `python.sh` to install.
- Customize what flatpaks to install using `flathub.list` and use `flathub.sh` to install.

# Additional comments
Might make a GUI wrapper for this if time allows.