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

echo "aci color palette:
${comment}comment
${red}red
${green}green
${orange}orange
${blue}blue
${purple}purple
${boldlightgreen}boldlightgreen
${boldbeige}boldbeige
${boldlightblue}boldlightblue
${reset}reset
"

echo "${comment}setting terminator $reset"

if [ "~/.config/terminator" ]
then
	echo "${comment}terminator already set. backing previous settings... $reset"
	cp -R ~/.config/terminator/config config.bak
else
	mkdir -p ~/.config/terminator
fi

if [ "~/.config/terminator/plugins" ]
then
	echo "${comment}seems that plugins are already installed"
else
	mkdir -p ~/.config/terminator/plugins
	wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
	echo "go check terminator > preferences > plugins > TerminatorThemesthen cp -R config ~/.config/terminator/config"
fi

echo "terminator set. Dont forget to copy config : cp -R config ~/.config/terminator/config"