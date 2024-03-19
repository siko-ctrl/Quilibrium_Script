# Quilibrium Setup Script

## Description
The Quilibrium Setup Script automates the setup process for configuring a Quilibrium node. It is designed to simplify the setup process, especially for new users, by automating various tasks required to set up a node efficiently.

## Installation

### 1. Clone the Quilibrium CeremonyClient Repository
Clone the Quilibrium CeremonyClient repository from GitHub:

```bash
git clone https://github.com/siko-ctrl/Quilibrium_Script


3. Set Script Permissions
Ensure that the script file quil.sh has executable permissions:



chmod +x quil.sh
Usage
1. Execute the Setup Script
Execute the script to set up the Quilibrium node:



./quil.sh
The script will automate various setup tasks required to configure the Quilibrium node.

Additional Steps
After waiting for approximately 30 minutes, it's recommended to backup your keys and config files:

1. Navigate to the .config Directory


cd ~/.config
2. Backup Keys and Config Files
Copy the keys.yml and config.yml files to a safe location, such as your desktop:

cp keys.yml config.yml ~/Desktop
This puts your keys and config on /Desktop so you can backup them later
Note
Ensure that you have administrative privileges to run the script and that it has executable permissions. This script automates various setup tasks required for configuring a Quilibrium node, simplifying the process for new users.
