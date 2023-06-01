#!/bin/bash

# Create the screenshots directory if it doesn't exist
mkdir -p ~/Pictures/Screenshots

# Define the screenshot file path with a timestamp
file_path=~/Pictures/Screenshots/screenshot_$(date +"%Y%m%d_%H%M%S").png

# Capture the screenshot and save it to the file path
scrot "$file_path"

# Copy the screenshot to the clipboard
xclip -selection clipboard -t image/png -i "$file_path"

# Display a notification
notify-send "Screenshot captured and copied to clipboard: $file_path"

