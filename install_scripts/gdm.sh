#!/bin/bash

# Function to check if a service is active and enabled
service_active_and_enabled() {
    local service="$1"
    # Check if service is active and enabled
    sudo systemctl is-active --quiet "$service" && sudo systemctl is-enabled --quiet "$service"
}

# Check if GDM3 is installed and enabled
check_gdm() {
    service_active_and_enabled gdm3
}

# Check if SDDM is installed and enabled
check_sddm() {
    service_active_and_enabled sddm
}

# Check if LightDM is installed and enabled
check_lightdm() {
    service_active_and_enabled lightdm
}

# Check if LXDM is installed and enabled
check_lxdm() {
    service_active_and_enabled lxdm
}

# Check if Ly is installed and enabled
check_ly() {
    service_active_and_enabled ly
}

# Check if SLiM is installed and enabled
check_slim() {
    service_active_and_enabled slim
}

# Function to ask if user wants to install GDM3 if another DM is installed
ask_install_gdm() {
    read -p "GDM3 is recommended. Install? (y/n): " answer
    case $answer in
        [yY])
            install_gdm
            ;;
        *)
            echo "Okay, exiting."
            exit 0
            ;;
    esac
}

# Function to install and enable GDM3
install_gdm() {
    echo "Installing minimal GDM3 (recommended)..."
    sudo apt update
    sudo apt install -y --no-install-recommends gdm3
    sudo systemctl enable gdm3
    echo "GDM3 has been installed and enabled."
}

# Function to install and enable SDDM
install_sddm() {
    echo "Installing minimal SDDM..."
    sudo apt update
    sudo apt install -y --no-install-recommends sddm
    sudo systemctl enable sddm
    echo "SDDM has been installed and enabled."
}

# Function to install and enable LightDM
install_lightdm() {
    echo "Installing LightDM (recommended)..."
    sudo apt update
    sudo apt install -y lightdm
    sudo systemctl enable lightdm
    echo "LightDM has been installed and enabled."
}

# Function to install and enable LXDM
install_lxdm() {
    echo "Installing LXDM..."
    sudo apt update
    sudo apt install -y --no-install-recommends lxdm
    sudo systemctl enable lxdm
    echo "LXDM has been installed and enabled."
}

# Function to install and enable SLiM
install_slim() {
    echo "Installing SLiM..."
    sudo apt update
    sudo apt install -y slim
    sudo systemctl enable slim
    echo "SLiM has been installed and enabled."
}

# Check which display managers are installed and enabled
if check_gdm; then
    echo "GDM3 is already installed and enabled (recommended)."
    exit 0
elif check_sddm; then
    echo "SDDM is already installed and enabled."
    ask_install_gdm
    exit 0
elif check_lightdm; then
    echo "LightDM is already installed and enabled."
    ask_install_gdm
    exit 0
elif check_lxdm; then
    echo "LXDM is already installed and enabled."
    ask_install_gdm
    exit 0
elif check_ly; then
    echo "Ly is already installed and enabled."
    ask_install_gdm
    exit 0
elif check_slim; then
    echo "SLiM is already installed and enabled."
    ask_install_gdm
    exit 0
fi

# If none of the above are installed, offer a choice to the user
echo "No supported display manager found."

# Menu for user choice
echo "Choose an option (or '0' to skip):"
echo "1. Install minimal GDM3 (recommended)"
echo "2. Install minimal SDDM"
echo "3. Install LightDM"
echo "4. Install LXDM"
echo "5. Install SLiM"

read -p "Enter your choice (0/1/2/3/4/5): " choice

case $choice in
    0)
        echo "Skipping installation."
        exit 0
        ;;
    1)
        install_gdm
        ;;
    2)
        install_sddm
        ;;
    3)
        install_lightdm
        ;;
    4)
        install_lxdm
        ;;
    5)
        install_slim
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

