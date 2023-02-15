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

echo "${boldlightgreen}CREATING BACKUP FROM PREVIOUS CONFIG...${boldlightgrey}"
echo "cp ~/.i3/config ./config.bak"
cp ~/.i3/config ./config.bak

echo "${boldlightgreen}REPLACING CONFIG${boldlightgrey}"
echo "cp -R config ~/.i3/config"
cp -R ./config ~/.i3/config
