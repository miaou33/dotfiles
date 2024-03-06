#!/bin/zsh

# :::::::::::::::::::::::::::::::::: Terminal & Shell ::
# Zsh
yay -S zsh zsh-completions zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting zsh-history-substring-search 
yay -S  powerline powerline-fonts zsh-theme-powerlevel10k

yay -S bash-completion

# Terminal emulators
yay -S terminator python-requests
yay -S kitty

# Utils
yay -S bat eza btop

# ::::::::::::::::::::::::::::::::::::::::::::::: Dev ::
# Editors
yay -S visual-studio-code-bin
yay -S nvim nvim-packer-git vim-copilot-git neovim-lspconfig unzip

# Tools
yay -S valgrind gdb lldb

# Docker
yay -S docker docker-buildx docker-compose 


# ::::::::::::::::::::::::::::::::::::::::::: Desktop ::
yay -S google-chrome
yay -S discord
yay -S rofi rofi-code
yay -S nautilus nautilus-image-converter libnautilus-extension
yay -S polybar
yay -S feh
yay -S gnome-screenshot
yay -S dunst

# :::::::::::::::::::::::::::::::::::::::: Appearance ::
yay -S xorg-xrandr
yay -S picom
yay -S lxappearance

# ::::::::::::::::::::::::::::::::::::::::::: Session ::
yay -S i3exit
yay -S lightdm lightdm-slick-greeter lightdm-gtk-greeter accountsservice

# ::::::::::::::::::::::::::::::::::::::::::: Devices ::
yay -S inetutils
yay -S libinput-gestures

# ::::::::::::::::::::::::::::::::::::::::::: Drivers ::
yay -S bluez bluez-utils rofi-bluetooth-git
yay -S playerctl