#!/bin/bash

echo "installing essential packages"
sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo snap refresh
snap install discord code
sudo apt install clang git vim valgrind terminator fish
sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo snap refresh

./terminator/config.sh