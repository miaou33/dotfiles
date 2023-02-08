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

echo "aci color palette:
${comment}comment
${red}red
${green}green
${orange}orange
${blue}blue
${purple}purple
${boldlightgreen}boldlightgreen
${boldwhite}boldwhite
#${eight}eight
${boldlightgrey}boldlightgrey
${reset}reset"

sudo pacman-mirrors --country France && pacman -Syyu
sudo pacman -Syu zsh zsh-completions zsh-autosuggestions zsh-history-substring-search
sudo pacman -Syu firefox discord alacritty

echo "\n${boldlightgreen}REMOVE BEEP${boldlightgrey}\n
Blacklisting the pcspkr and snd_pcsp modules will prevent udev from loading them at boot.
create the file: /etc/modprobe.d/nobeep.conf and edit :
blacklist pcspkr
blacklist snd_pcsp${reset}\n

\n${boldlightgreen}NATURAL SCROLLING & DISABLE TOUCHSCREEN${boldlightgrey}\n
Edit /usr/share/X11/xorg.conf.d/40-libinput.conf
--> Add to mouse Option "NaturalScrolling" "True"${reset}\n
--> Add to touchscreen Option "Ignore" "on"${reset}\n

"
