#!/bin/bash

# Enable trim to preservce SSD
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

# Update system
sudo pacman -Syu

# Install git and base-devel
sudo pacman -Syu git base-devel

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Generate a dvpt database for *-git packages that were installed without yay
yay -Y --gendb
# Check for dvpt package updates
yay -Syu --devel
# Make dvpt packages updates permanent
yay -Y --devel --save

# Colored output for pacman and yay
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

# Git config
git config --global user.email "nfauconn@student.42.fr"
git config --global user.name "no3"

# VIRTUALBOX
yay -S virtualbox-guest-utils
sudo modprobe -a vboxguest vboxsf vboxvideo
sudo systemctl enable vboxservice
sudo systemctl start vboxservice

# SSH key
ssh-keygen

