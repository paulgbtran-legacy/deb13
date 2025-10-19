#!/bin/bash

# python.sh
# Author: Paul Tran <home.paulgbtran@gmail.com>
# For personal use only!
# This is a shell script to install my Python packages

cd ~
python3 -m venv .venv
source .venv/bin/activate
cd -
pip install $(cat python.list)
echo -e 'Setup completed.'