#!/bin/bash 
  
 # Define session file path 
 SESSION_FILE_PATH="/usr/share/wayland-sessions/sway.desktop" 
  
 # Create the session file for Sway 
 echo "Creating Sway session file..." 
  
 sudo bash -c "cat > $SESSION_FILE_PATH <<EOF 
 [Desktop Entry] 
 Name=Sway 
 Comment=This session will start Sway 
 Exec=sway 
 Type=Application 
 DesktopNames=Sway 
 EOF" 
  
 # Set the correct permissions for the session file 
 echo "Setting correct permissions..." 
 sudo chmod 644 $SESSION_FILE_PATH 
  
 # Notify the user of completion 
 echo "Sway session added to the login manager."
