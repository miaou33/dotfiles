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

echo "${boldlightgreen}setting terminator $reset"

if [ "~/.config/terminator" ]
then
	echo "${blue}terminator already set. backing previous settings... $reset"
	cp -R ~/.config/terminator/config ~/.config/terminator/config.bak
else
	mkdir -p ~/.config/terminator
fi

if [ "~/.config/terminator/plugins" ]
then
	echo "${blue}seems that plugins are already installed"
else
	mkdir -p ~/.config/terminator/plugins
	wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
	echo "${purple}go check terminator > preferences > plugins > TerminatorThemesthen cp -R config ~/.config/terminator/config"
fi

echo "${boldlightgreen}terminator set.
${red}Dont forget to copy config : cp -R config ~/.config/terminator/config${reset}"