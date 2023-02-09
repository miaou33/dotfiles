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

#add vi mode fonctionality
#echo "'bind key -v' >> ~/.zshrc"
#echo "bind key -v" >> ~/.zshrc

echo "alias gcl='git clone' >> ~/.zshrc"
echo "alias gcl='git clone'" >> ~/.zshrc
