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
yay -S virtualbox-guest-utils-nox 
sudo modprobe -a vboxguest vboxsf vboxvideo
sudo systemctl enable vboxservice
sudo systemctl start vboxservice

# WARNING: hyprland does not work well with nvidia. Follow the instructions on the website to install the drivers.

yay -S \
		dunst \
		dolphin \
		firefox \
		foot \
		kitty \
		hyprland \
		neovim \
		qt5-wayland \
		qt6-wayland \
		xdg-desktop-portal-hyprland \
		vim \
		waybar \
		wofi \

# BUILD FROM SOURCE: 
yay -S \
		alacritty \
		cairo \
		cmake \
		cpio \
		dolphin \
		firefox \
		foot \
		gcc \
		gdb \
		hyprpaper \
		libdisplay-info \
		libinput \
		libliftoff \
		libx11 \
		libxcb \
		libxcomposite \
		libxfixes \
		libxkbcommon \
		libxrender \
		kitty \
		meson \
		neovim \
		ninja \
		pango \
		pixman \
		seatd \
		tomlplusplus \
		ttf-font-awesome \
		waybar \
		wayland-protocols \
		wofi \
		xcb-proto \
		xcb-util \
		xcb-util-keysyms \
		xorg-xinput \
		xcb-util-wm \
		xorg-xwayland

git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
make all && sudo make install