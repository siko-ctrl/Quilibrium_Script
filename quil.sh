#!/bin/bash

# Check if sudo is available
if ! [ -x "$(command -v sudo)" ]; then
  echo 'Error: sudo is not installed. This script requires sudo to run.' >&2
  exit 1
fi

# Update system package list
sudo apt update

# Install necessary packages
sudo apt install -y git wget ufw make gcc build-essential

# Install Rust if not already installed
if ! [ -x "$(command -v rustc)" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source $HOME/.cargo/env
fi

# Install Go if not already installed
if ! [ -x "$(command -v go)" ]; then
  wget https://go.dev/dl/go1.20.14.linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf go1.20.14.linux-amd64.tar.gz
  rm go1.20.14.linux-amd64.tar.gz
fi

# Set GO environment variables
export PATH=$PATH:/usr/local/go/bin
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Install tar if not already installed
if ! [ -x "$(command -v tar)" ]; then
  sudo apt install -y tar
fi

# Configure Linux network device settings
sudo tee -a /etc/sysctl.conf <<EOF
# Increase buffer sizes for better network performance
net.core.rmem_max=600000000
net.core.wmem_max=600000000
EOF
sudo sysctl -p

# Configure Node Network Firewall
sudo ufw enable <<< "y"
sudo ufw allow 22
sudo ufw allow 8336
sudo ufw allow 443
sudo ufw status

# Create a swapfile of 24GB
sudo fallocate -l 24G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# Make swap permanent
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Clone the Quilibrium CeremonyClient Repository
cd ~
git clone https://github.com/QuilibriumNetwork/ceremonyclient.git

# Go to the ceremonyclient/node folder
cd ceremonyclient/node

# Run "go run" once to create your Q Wallet and .config folder
GOEXPERIMENT=arenas go run ./...
