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

#enable trim to preservce SSD
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer


sudo pacman -Syu
sudo pacman -Syu git

git config --global user.email "nfauconn@student.42.fr"
git config --global user.name "no3"

ssh-keygen

git clone https://aur.archlinux.org/yay.git
git clone 

# SHELL
yay -S zsh zsh-completions zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting zsh-history-substring-search 
yay -S  powerline powerline-fonts zsh-theme-powerlevel10k

# Apps
yay -S terminator python-requests
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
yay -S google-chrome
yay -S discord
yay -S visual-studio-code-bin
yay -S nvim

# Code tools
yay -S valgrind 
yay -S bat eza 
yay -S unzip 
yay -S nvim-packer-git vim-copilot-git neovim-lspconfig
yay -S docker docker-buildx docker-compose 
sudo systemctl start docker.service
sudo systemctl start docker.socket
sudo systemctl enable docker.service
sudo systemctl enable docker.socket
sudo groupadd docker
sudo usermod -aG docker $USER
yay -S inetutils

# Desktop
yay dex
yay font
yay xorg-xrandr
yay rofi rofi-code
yay -S dolphin dolphin-plugins
yay -S i3exit
yay -S polybar
yay -S picom-git
yay -S feh
yay -S picom lxappearance
yay -S gnome-screenshot
yay -S dunst
yay -S libinput-gestures
yay -S btop

#bumblebee-status sensors2 pasink pasource powerline powerline-fonts pango
#install all existent fonts so u have a lot of them in once
#pacman -Syu all-repository-fonts

#devices set up (touchpad, mouse)
sudo cp -R 40-libinput.conf /usr/share/X11/xorg.conf.d/ 

#remove system beep
sudo cp nobeep.conf /etc/modprobe.d/
