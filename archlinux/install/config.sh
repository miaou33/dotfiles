#!/bin/zsh

# ::::::::::::::::::::::::::::::::::::::::: Variables ::
export DOTFILES_DIR=$HOME/dotfiles/archlinux/dotfiles

# :::::::::::::::::::::::::::::::::: Terminal & Shell ::
# Zsh
rm -rf $HOME/.zshrc
ln -s $DOTFILES_DIR/.zshrc $HOME/.zshrc
source $HOME/.zshrc

# Terminator
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
cp -R $DOTFILES_DIR/.config/terminator/config $HOME/.config/terminator/

# ::::::::::::::::::::::::::::::::::::::::::::: Dev ::
# Docker
sudo systemctl start docker.service
sudo systemctl start docker.socket
sudo systemctl enable docker.service
sudo systemctl enable docker.socket
sudo groupadd docker
sudo usermod -aG docker $USER

# :::::::::::::::::::::::::::::::::::::::::: Session ::
# Lightdm
sudo systemctl start lightdm
sudo systemctl enable lightdm
sudo chown -R lightdm:lightdm /run/lightdm
sudo chown -R lightdm:lightdm /var/lib/lightdm-data
sudo chmod 700 /run/lightdm
sudo chmod 700 /var/lib/lightdm-data
sudo systemctl start accounts-daemon
sudo systemctl enable accounts-daemon

# ::::::::::::::::::::::::::::::::::::::::::: Devices ::

sudo gpasswd -a $USER input

#devices set up (touchpad, mouse)
sudo cp -R etc/X11/xorg.conf.d/40-libinput.conf /usr/share/X11/xorg.conf.d/ 

#remove system beep
sudo cp etc/modprobe.d/nobeep.conf /etc/modprobe.d/
