#!/bin/bash

# Update package list
sudo apt -q update

# Install Git
sudo apt install git -y
git --version

# Install GO
wget https://go.dev/dl/go1.20.14.linux-amd64.tar.gz
sudo tar -xvf go1.20.14.linux-amd64.tar.gz -C /usr/local/
sudo rm go1.20.14.linux-amd64.tar.gz

# Set GO environment variables
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
go version

# Configure Linux network device settings
sudo bash -c 'cat <<EOF >> /etc/sysctl.conf
# Increase buffer sizes for better network performance
net.core.rmem_max=600000000
net.core.wmem_max=600000000
EOF'
sudo sysctl -p

# Configure Node Network Firewall
sudo ufw enable <<< "y"
sudo ufw allow 22
sudo ufw allow 8336
sudo ufw allow 443
sudo ufw status

# Clone the Quilibrium CeremonyClient Repository
cd ~
git clone https://github.com/QuilibriumNetwork/ceremonyclient.git

# Go to the ceremonyclient/node folder
cd ceremonyclient/node

# Run "go run" once to create your Q Wallet and .config folder
GOEXPERIMENT=arenas go run ./...
