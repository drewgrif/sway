#!/bin/bash

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

clear 

for script in setup.sh packages.sh display_manager.sh add_bashrc.sh printers.sh bluetooth.sh ; do
    script_path="$HOME/sway/install_scripts/$script"
    if [ -x "$script_path" ]; then
        bash "$script_path"
    else
        echo "Script $script_path not found or not executable. Skipping."
    fi
    clear
done
sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
