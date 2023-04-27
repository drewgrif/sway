#!/bin/sh

sudo apt install neofetch exa firefox-esr

# Sway installation for Debian Bookworm/Testing
sudo apt install sway waybar swaylock swayidle swaybg

# Appearance manager (use nwg-look instead
# sudo apt install lxappearance

# Networking etc
sudo apt install policykit-1-gnome network-manager network-manager-gnome

# Thunar
sudo apt install thunar thunar-archive-plugin thunar-volman file-roller

# terminal
sudo apt install kitty

# protocols
sudo apt install mtools dosfstools acpi acpid avahi-daemon gvfs-backends libnotify-dev
sudo systemctl enable acpid
sudo systemctl enable avahi-daemon

# grim (screenshots in Wayland) and slurp (select a region in wayland) - kinda like scrot
sudo apt install grim slurp

# mako - like dunst
sudo apt install mako-notifier

# wofi - confusingly similar to rofi
sudo apt install wofi

# wayland protocols library
sudo apt install wayland-protocols

# backwards compatible 
sudo apt install xwayland

# nvidia you may need libnvidia-egl-wayland-dev

# GTK layer shell
sudo apt install libgtk-layer-shell-dev

# Support for the screenshot, screencast, and possibly remote-desktop xdg-desktop-portal interfaces for wlroots based compositors. 
sudo apt install xdg-desktop-portal-wlr

# GTK layer shell - wl-clipboard implements two Wayland clipboard utilities, wl-copy and wl-paste
# dex executes .desktop files - jq = lightweight and flexible command-line JSON processor
sudo apt install brightnessctl wl-clipboard dex jq

# text editor
sudo apt install l3afpad geany geany-plugins

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# build essential
sudo apt install build-essential

# Dependencies for ly
sudo apt install libpam0g-dev libxcb-xkb-dev

# ly install
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
sudo systemctl enable ly

sudo apt install fonts-font-awesome



