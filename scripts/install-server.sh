#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install nginx
sudo apt install nginx -y

# Install Curl
sudo apt install curl -y

# Install Netdata Cloud
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh

# Enable firewall and allow necessary ports
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw allow 19999/tcp
sudo ufw --force enable

# Start and enable nginx
sudo systemctl start nginx
sudo systemctl enable nginx
