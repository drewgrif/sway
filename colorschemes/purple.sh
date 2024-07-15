#!/bin/sh

# Function to check if a directory exists
check_directory() {
    if [ -d "$1" ]; then
        return 0  # Directory exists
    else
        return 1  # Directory does not exist
    fi
}

# Check if Colloid-icon-theme is installed
if check_directory "$HOME/.local/share/icons/Colloid-Dark"; then
    echo "Colloid-icon-theme is already installed."
else
    echo "Installing Colloid-icon-theme..."
    cd ~/Downloads || exit
    if [ -d "Colloid-icon-theme" ]; then
        echo "Colloid-icon-theme repository already cloned. Skipping clone step."
    else
        git clone https://github.com/vinceliuice/Colloid-icon-theme.git
    fi
    cd Colloid-icon-theme || exit
    ./install.sh -t all -s dracula
    rm -rf ~/Downloads/Colloid-icon-theme/
fi

# Check if Lavanda-Dark is installed
if check_directory "$HOME/.themes/Lavanda-Dark"; then
    echo "Lavanda-gtk-theme is already installed."
else
    echo "Installing Lavanda-gtk-theme..."
    cd ~/Downloads || exit
    if [ -d "Lavanda-gtk-theme" ]; then
        echo "Lavanda-gtk-theme repository already cloned. Skipping clone step."
    else
        git clone https://github.com/vinceliuice/Lavanda-gtk-theme.git
    fi
    cd Lavanda-gtk-theme || exit
    yes | ./install.sh -c dark -t standard -s standard -i debian
    rm -rf ~/Downloads/Lavanda-gtk-theme
fi


bash ~/sway/colorschemes/update_gtk_settings.sh
