Quilibrium_Script
Description
This script serves as a simple setup tool for configuring a node, especially tailored for new users. It automates various setup tasks required to set up a node efficiently.

Usage
Clone the Quilibrium CeremonyClient Repository:

bash
Copy code
git clone https://github.com/QuilibriumNetwork/ceremonyclient.git
Navigate to the cloned repository:

bash
Copy code
cd ceremonyclient/node
Ensure that you have cloned the repository from my GitHub account.

Make sure to set the script file quil.sh as executable:

bash
Copy code
chmod +x quil.sh
Execute the script to set up the node:

bash
Copy code
./quil.sh
Additional Steps
After waiting for approximately 30 minutes, it's recommended to backup your keys and config files:

Navigate to the .config directory:

bash
Copy code
cd ~/.config
Copy the keys.yml and config.yml files to a safe location, such as your desktop:

bash
Copy code
cp keys.yml config.yml ~/Desktop
Note
Ensure that you have administrative privileges to run the script and that it has executable permissions. This script automates various setup tasks required for configuring a Quilibrium node, simplifying the process for new users.
