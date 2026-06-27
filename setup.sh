#!/bin/bash

# Installs everything in order using a single shell script
sudo apt update && sudo apt upgrade
bash basic.sh
bash security.sh
bash cloudflare_warp.sh
bash protonvpn.sh
bash brave.sh
bash vscode.sh
bash msedge.sh
bash miniconda.sh
bash steam.sh
bash flatpak.sh # Flatpak must be installed last, since it requires a reboot.
