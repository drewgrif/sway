#!/bin/bash

# Function to install vanilla sway
install_vanilla_sway() {
    echo "Set Keyboardlayout for Sway"
    bash ~/sway/install_scripts/keyboard.sh
    echo "Installing vanilla sway..."
    bash ~/sway/install_scripts/vanilla_sway.sh
}

# Function to install customized swayWM
install_custom_sway() {
    echo "Set Keyboardlayout for Sway"
    bash ~/sway/install_scripts/keyboard.sh
    echo "Installing JUSTAGUYLINUX customized sway..."
    bash ~/sway/install_scripts/custom_sway.sh
}

# Function to prompt user for installation choice (vanilla or customized)
prompt_installation_choice() {
    local wm_name="$1"
    echo "$wm_name Installation"
    echo "1. Install $wm_name with no customization"
    echo "2. Install $wm_name with JUSTAGUYLINUX customized"
    echo "Or ENTER to skip"
    read -r choice

   case "$choice" in
        1)
            echo "Installing $wm_name with no customization..."
            ;;
        2)
            echo "Installing $wm_name with JUSTAGUYLINUX customized..."
            ;;
        *)
            echo "Skipping installation of $wm_name."
            ;;
    esac
    
    # Adding a couple of line returns
    echo -e "\n\n"
}

# Main script starts here

# Array to store user choices
declare -A choices

# Prompt for each window manager and store choices in the array
prompt_and_store_choice() {
    local wm_name="$1"
    prompt_installation_choice "$wm_name"
    choices["$wm_name"]=$choice
}

# Prompt for swayWM installation
prompt_and_store_choice "sway"


# Install based on user choices stored in the array
for wm_name in "${!choices[@]}"; do
    case "${choices[$wm_name]}" in
        1)
            case "$wm_name" in
                "sway")
                    install_vanilla_sway
                    ;;
                *)
                    echo "Installation function not defined for $wm_name"
                    ;;
            esac
            ;;
        2)
            case "$wm_name" in
                "sway")
                    install_custom_sway
                    ;;
                *)
                    echo "Installation function not defined for $wm_name"
                    ;;
            esac
            ;;
        *)
            echo "Skipping $wm_name installation..."
            ;;
    esac
done

echo "All installations completed."


