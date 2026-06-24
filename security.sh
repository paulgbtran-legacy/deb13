#!/bin/bash
# SECURITY APP CONFIGURATION

# Set up clamav
sudo apt install clamav clamav-daemon clamav-freshclam clamdscan 
                        # In case packages.list doesn't have these

# Copy config files to clamav's location
sudo cp ./clamav/clamd.conf /etc/clamav/clamd.conf
sudo cp ./clamav/clamav /etc/sudoers.d/clamav
sudo cp ./clamav/virus-event.bash /etc/clamav/virus-event.bash
sudo cp ./clamav/clamav-milter.conf /etc/clamav/clamav-milter.conf
sudo cp ./clamav/clamav-milter.service /etc/systemd/system/clamav-milter.service
echo -e 'Copy these lines below to clamav-clamonacc.service: \n' > instruction.txt
cat ./clamav/clamav-clamonacc.service >> instruction.txt
nano instruction.txt
rm instruction.txt
sudo systemctl edit clamav-clamonacc.service # Needs manual user pasting afterwards
sudo systemctl daemon-reload
# Start all clamav services
sudo systemctl start clamav-clamonacc.service && sudo systemctl enable clamav-clamonacc.service
sudo systemctl start clamav-daemon.service && sudo systemctl enable clamav-daemon.service
sudo systemctl start clamav-freshclam.service && sudo systemctl enable clamav-freshclam.service
sudo systemctl start clamav-freshclam-once.timer && sudo systemctl enable clamav-freshclam-once.timer
sudo systemctl enable clamav-milter.service

# Set up ufw
sudo systemctl start ufw.service
sudo systemctl enable ufw.service
sudo ufw default deny
sudo ufw allow 443/tcp
sudo ufw limit 22/tcp
sudo ufw enable

# Set up rkhunter
sudo rkhunter --propupd

sudo systemctl status clamav-clamonacc.service clamav-daemon.service clamav-freshclam.service clamav-freshclam-once.timer clamav-milter.service ufw.service rkhunter.service ufw.service rkhunter.service