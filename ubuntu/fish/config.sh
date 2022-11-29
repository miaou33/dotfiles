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


if [ ! -d "/home/fjeiwjifeoh/.local/share/omf" ];
then
	echo "${boldlightgreen}installing omf...${reset}"
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
else
	echo "${blue}omf already installed !"
fi
#set -U fish_key_bindings fish_vi_key_bindings
#omf install dangerous
#set -U dangerous_nogreeting
#alias --save gcl "git clone"
#alias --save bat batcat