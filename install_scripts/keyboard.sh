#!/bin/bash

# File path to append the keyboard layout
config_file="$HOME/sway/configs/sway/config.d/default"

# List all keyboard layouts
echo "Available keyboard layouts:"
localectl list-keymaps

# Ask the user to select a keyboard layout
read -p "Enter the keyboard layout you want to use: " selected_layout

# Check if the selected layout is not empty
if [ -n "$selected_layout" ]; then
  # Append the keyboard layout configuration to the Sway config file
  echo -e "\n# Keyboard layout\ninput * {\n  xkb_layout \"$selected_layout\"\n}" >> "$config_file"
  echo "Keyboard layout '$selected_layout' has been added to $config_file."
else
  echo "No layout selected. Exiting."
fi
