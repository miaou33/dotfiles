#!/bin/bash

WALLPAPER_LIGHT="/home/noe/Images/gemston2k.png"
WALLPAPER_DARK="/home/noe/Images/gemston2k.png"

GTK_CONFIG_FILE="$HOME/.config/gtk-3.0/settings.ini"

if [ "$1" = "light" ]; then
	sed -i 's/gtk-theme-name=Adwaita-dark$/gtk-theme-name=Adwaita/' "$GTK_CONFIG_FILE"
	feh --no-fehbg --bg-fill "$WALLPAPER_LIGHT"
elif [ "$1" = "dark" ]; then
	sed -i 's/gtk-theme-name=Adwaita$/gtk-theme-name=Adwaita-dark/' "$GTK_CONFIG_FILE"
	feh --no-fehbg --bg-fill "$WALLPAPER_DARK"
else
	echo "Usage: $0 [light|dark]"
fi
