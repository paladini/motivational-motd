#!/usr/bin/sh
sudo systemctl disable motivational-motd.timer
sudo systemctl stop motivational-motd.timer
sudo rm /etc/systemd/system/motivational-motd.service
sudo rm /etc/systemd/system/motivational-motd.timer
sudo rm -rf /var/lib/motivational-motd/
