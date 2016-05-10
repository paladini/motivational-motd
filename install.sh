#!/usr/bin/sh

if [ -f "/etc/systemd/system/motivational-motd.service" ] && [ -f "/etc/systemd/system/motivational-motd.timer" ] && [ -d "/var/lib/motivational-motd" ];
then
	echo "Seems that you already has 'motivational-motd' installed in your machine. What I'm supposed to do?"
else
	echo "Installing motivational-motd."
	sudo cp lib/systemd/motivational-motd.service /etc/systemd/system/
	sudo cp lib/systemd/motivational-motd.timer /etc/systemd/system/
	sudo mkdir /var/lib/motivational-motd
	sudo cp lib/change_quote.py /var/lib/motivational-motd/
	sudo cp lib/quotes.txt /var/lib/motivational-motd/

	sudo systemctl enable motivational-motd.timer
	sudo systemctl start motivational-motd.timer
	sudo systemctl start motivational-motd.service
	echo "Done! A service will run every day at 00:00 to show you a new motivational phrase."
fi