#!/bin/sh

apt install sntp -y

timedatectl set-timezone Europe/Prague

sudo sntp -s time.google.com

crontab -l
echo "01 3 * * * sntp -s time.google.com" >>/tmp/crontab.$$ 
crontab /tmp/crontab.$$                           #(3)
rm /tmp/crontab.$$  
