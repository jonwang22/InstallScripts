#!/bin/bash

# Update the system
sudo apt update -y && sudo apt upgrade -y

# Install wget
sudo apt install wget -y

# Install Grafana
# Add Grafana GPG key and repository
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

# Update package list and install Grafana
sudo apt update -y
sudo apt install grafana -y

# Start and enable Grafana service
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Print the public IP address
echo "Installation complete. Access Prometheus at http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):9090"
echo "Access Grafana at http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):3000"
echo "Default Grafana login is admin/admin"
