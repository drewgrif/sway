#!/bin/bash

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Attempting to install Git..."
    
    # Use apt to install git
    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install git -y
    else
        echo "Cannot install Git automatically using apt. Please install Git manually and run this script again."
        exit 1
    fi
    
    # Check again if git is installed after attempting to install
    if ! command -v git &> /dev/null; then
        echo "Git installation failed. Please install Git manually and run this script again."
        exit 1
    fi
fi

echo "Git is installed. Continuing with the script..."
# Add further commands here after ensuring Git is installed



# Clone the repository into the home directory
git clone https://github.com/drewgrif/sway ~/sway


clear
echo "
 +-+-+-+-+-+-+-+-+-+-+-+-+-+ 
 |j|u|s|t|a|g|u|y|l|i|n|u|x| 
 +-+-+-+-+-+-+-+-+-+-+-+-+-+ 
 |c|u|s|t|o|m| |s|c|r|i|p|t| 
 +-+-+-+-+-+-+ +-+-+-+-+-+-+                                                                                                            
"

# Make setup.sh executable (if needed, though it's typically already executable)
# chmod +x setup.sh packages.sh

# Run the setup script
bash ~/sway/install_scripts/setup.sh

clear

# Run the extra packages
bash ~/sway/install_scripts/packages.sh

clear

echo "Make sure a Display Manager is installed"

# make sure gdm3 is installed
bash ~/sway/install_scripts/gdm.sh

clear

# add bashrc question
bash ~/sway/install_scripts/add_bashrc.sh

clear 

bash ~/sway/install_scripts/printers.sh

clear 

bash ~/sway/install_scripts/bluetooth.sh

bash ~/sway/install_scripts/addsession.sh

clear 


sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"

