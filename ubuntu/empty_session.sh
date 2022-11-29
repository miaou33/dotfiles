#!/bin/bash

comment=$'\033[0;30m'
red=$'\033[0;31m'
green=$'\033[0;32m'
orange=$'\033[0;33m'
blue=$'\033[34m'
purple=$'\033[1;35m'
boldlightgreen=$'\033[1;36m'
boldbeige=$'\033[1;37m'
#eight=$'\033[1;38m' same as boldbeige
boldlightblue=$'\033[1;39m'
reset=$'\033[0m'

#echo "aci color palette:
#${comment}comment
#${red}red
#${green}green
#${orange}orange
#${blue}blue
#${purple}purple
#${boldlightgreen}boldlightgreen
#${boldbeige}boldbeige
#${boldlightblue}boldlightblue
#${reset}reset
#"

echo "${boldlightgreen}installing essential packages${reset}"
sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo snap refresh
sudo snap install discord code vlc
sudo apt install clang git curl vim valgrind terminator fish bat gnome-tweaks gnome-shell-extension-prefs
sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo snap refresh

if [ -f "/usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com" ];
then
	echo "${boldlightgreen}removing the dock ...
	${blue}mv /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com{,.bak}${reset}"
	cd /usr/share/gnome-shell/extensions/
	sudo mv ubuntu-dock@ubuntu.com{,.bak}
fi
#put the dock again
#cd /usr/share/gnome-shell/extensions/
#sudo mv ubuntu-dock@ubuntu.com{.bak,}
