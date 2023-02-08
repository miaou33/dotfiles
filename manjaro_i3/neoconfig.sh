#!/bin/bash

comment=$'\033[0;30m'
red=$'\033[0;31m'
green=$'\033[0;32m'
orange=$'\033[0;33m'
blue=$'\033[34m'
purple=$'\033[1;35m'
boldlightgreen=$'\033[1;36m'
boldwhite=$'\033[1;37m'
#eight=$'\033[1;38m' #same as boldbeige
boldlightgrey=$'\033[1;39m'
reset=$'\033[0m'

#echo "aci color palette:
#${comment}comment
#${red}red
#${green}green
#${orange}orange
#${blue}blue
#${purple}purple
#${boldlightgreen}boldlightgreen
#${boldwhite}boldwhite
#${eight}eight
#${boldlightgrey}boldlightgrey
#${reset}reset"

#UNCOMMENT LINES !!!!!!!!!!!!!!!!!!!!!!!!!! commented to test others while writing it

echo "${boldlightgreen}SETTING MIRRORS TO FRANCE${boldlightgrey}"
#sudo pacman-mirrors --country France && pacman -Syyu

#ENABLE TRIM to take care of SSD
echo "${boldlightgreen}ENABLING TRIM${boldlightgrey}"
#sudo systemctl enable fstrim.timer
#sudo systemctl start fstrim.timer

#ENABLE FIREWALL
echo "${boldlightgreen}INSTALLING UFW (FIREWALL)${boldlightgrey}"
#sudo systemctl enable ufw
#sudo systemctl start ufw

#####natural scrolling and disable touchscreen#####
echo "${boldlightgreen}SETTING NATURAL SCROLLING & DISABLING TOUCHSCREEN${boldlightgrey}"
#sudo cp /usr/share/X11/xorg.conf.d/40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf.bak
#sudo cp -R 40-libinput.conf /usr/share/X11/xorg.conf.d/ 

#Blacklisting the pcspkr and snd_pcsp modules (beep modules) will prevent udev from loading them at boot.
echo "${boldlightgreen}REMOVING BEEP${boldlightgrey}"
#sudo cp nobeep.conf /etc/modprobe.d/

echo "${boldlightgreen}INSTALLING PACKAGES${boldlightgrey}"
#sudo pacman -Syu yay

sudo yay -Syu	zsh zsh-completions zsh-autosuggestions zsh-history-substring-search \
				firefox \
				discord \
				alacritty \
				emacs

#So, say you connected VGA1 and want to use it as an additional screen:
#xrandr --output VGA1 --auto --left-of LVDS1 
