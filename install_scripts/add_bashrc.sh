#!/bin/bash

echo "Would you like to overwrite your current .bashrc with the justaguylinux .bashrc? (y/n)"
read response

if [[ "$response" =~ ^[Yy]$ ]]; then
    wget https://github.com/drewgrif/jag_dots/blob/main/.bashrc ~
    echo "justaguylinux .bashrc has been copied to ~/.bashrc"
elif [[ "$response" =~ ^[Nn]$ ]]; then
    echo "No changes have been made to ~/.bashrc"
else
    echo "Invalid input. Please enter 'y' or 'n'."
fi
