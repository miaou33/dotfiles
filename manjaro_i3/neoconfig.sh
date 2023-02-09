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

echo "
"

#UNCOMMENT LINES !!!!!!!!!!!!!!!!!!!!!!!!!! commented to test others while writing it

echo "${boldlightgreen}SETTING MIRRORS TO FRANCE${boldlightgrey}"
echo "sudo pacman-mirrors --country France && pacman -Syyu"
#sudo pacman-mirrors --country France && pacman -Syyu

echo "
"

#ENABLE TRIM to take care of SSD
echo "${boldlightgreen}ENABLING TRIM${boldlightgrey}"
echo "sudo systemctl enable fstrim.timer"
echo "sudo systemctl start fstrim.timer"
#sudo systemctl enable fstrim.timer
#sudo systemctl start fstrim.timer

echo "
"

#ENABLE FIREWALL
echo "${boldlightgreen}INSTALLING UFW (FIREWALL)${boldlightgrey}"
echo "sudo systemctl enable ufw"
echo "sudo systemctl start ufw"
#sudo systemctl enable ufw
#sudo systemctl start ufw

echo "
"

#####natural scrolling and disable touchscreen#####
echo "${boldlightgreen}SETTING NATURAL SCROLLING & DISABLING TOUCHSCREEN${boldlightgrey}"
echo "sudo cp /usr/share/X11/xorg.conf.d/40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf.bak"
echo "sudo cp -R 40-libinput.conf /usr/share/X11/xorg.conf.d/"
#sudo cp /usr/share/X11/xorg.conf.d/40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf.bak
#sudo cp -R 40-libinput.conf /usr/share/X11/xorg.conf.d/ 

echo "
"

#Blacklisting the pcspkr and snd_pcsp modules (beep modules) will prevent udev from loading them at boot.
echo "${boldlightgreen}REMOVING BEEP${boldlightgrey}"
echo "sudo cp nobeep.conf /etc/modprobe.d/"
#sudo cp nobeep.conf /etc/modprobe.d/

echo "
"

echo "${boldlightgreen}INSTALLING PACKAGES${boldlightgrey}"
#sudo pacman -Syu	yay \
#					zsh zsh-completions zsh-autosuggestions zsh-history-substring-search \
#					firefox \
#					discord \
#					alacritty \
#					emacs \
#					bat

#yay	visual-studio-code-bin

echo "
"

#!!!!!!!!CHANGE BEFORE UNCOMMENT (SEE NAME OF MONITOR DOING xrandr COMMAND!!!!!!!!!!!
echo "${boldlightgreen}CONNECTING MONITOR${boldlightgrey}"
#So, say you connected VGA1 and want to use it as an additional screen:
echo "xrandr --output VGA1 --auto --left-of LVDS1 "
#xrandr --output VGA1 --auto --left-of LVDS1 

echo "
"

echo "${boldlightgreen}SETTING FIREFOX AS DEFAULT BROWSER${boldlightgrey}"
echo "sed 's/Pale Moon/firefox/g' ~/.config/mimeapps.list"
#sed 's/Pale Moon/firefox/g' ~/.config/mimeapps.list > ~/.config/mimeapps.list.replace
#mv ~/.config/mimeapps.list.replace ~/.config/mimeapps.list
echo "sed 's/palemoon/firefox/g' ~/.profile"
#sed 's/palemoon/firefox/g' ~/.profile > ~/.profile.replace
#mv ~/.profile.replace ~/.profile

echo "
"

echo "${boldlightgreen}SETTING VIM AS DEFAULT EDITOR${boldlightgrey}"
echo "sed 's/nano/vim/g' ~/.config/mimeapps.list"
#sed 's/nano/vim/g' ~/.config/mimeapps.list > ~/.config/mimeapps.list.replace
#mv ~/.config/mimeapps.list.replace ~/.config/mimeapps.list
echo "sed 's/nano/vim/g' ~/.profile"
#sed 's/nano/vim/g' ~/.profile > ~/.profile.replace
#mv ~/.profile.replace ~/.profile

echo "
"

echo "${boldlightgreen}FINISH! u may go to subdirectories to exec their script${reset}"