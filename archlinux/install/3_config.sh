#!/bin/zsh

# ::::::::::::::::::::::::::::::::::::::::: Variables ::
export DOTFILES_DIR=$HOME/dotfiles/archlinux/dotfiles

# :::::::::::::::::::::::::::::::::: Terminal & Shell ::
# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf $HOME/.zshrc
ln -s $DOTFILES_DIR/.zshrc $HOME/.zshrc
source $HOME/.zshrc

# Terminator
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
cp -R $DOTFILES_DIR/.config/terminator/config $HOME/.config/terminator/

# ::::::::::::::::::::::::::::::::::::::::::::: Dev ::
# Docker
sudo systemctl enable docker.service
sudo systemctl enable docker.socket
sudo systemctl start docker.service
sudo systemctl start docker.socket
sudo groupadd docker
sudo usermod -aG docker $USER

# :::::::::::::::::::::::::::::::::::::::::: Session ::
# Lightdm
sudo systemctl enable lightdm
sudo systemctl start lightdm
sudo chown -R lightdm:lightdm /run/lightdm
sudo chown -R lightdm:lightdm /var/lib/lightdm-data
sudo chmod 700 /run/lightdm
sudo chmod 700 /var/lib/lightdm-data
sudo systemctl enable accounts-daemon
sudo systemctl start accounts-daemon

# ::::::::::::::::::::::::::::::::::::::::::: Devices ::

sudo gpasswd -a $USER input

#devices set up (touchpad, mouse)
sudo cp -R etc/X11/xorg.conf.d/40-libinput.conf /usr/share/X11/xorg.conf.d/ 

#remove system beep
sudo cp etc/modprobe.d/nobeep.conf /etc/modprobe.d/

sudo systemctl enable libinput-gestures.service
sudo systemctl start libinput-gestures.service

# ::::::::::::::::::::::::::::::::::::::::::: Drivers ::
# Bluetooth
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service


####################################################################################
####################################################################################
####################################################################################
####################################################################################

## Environment section
export DOTFILES_DIR="$HOME/.dot/archlinux/dotfiles"
export EDITOR=nvim
export TERMINAL=alacritty
export XDG_CONFIG_HOME="$HOME/.config"

## Keybindings section
bindkey -v

## Alias section
alias gita='git add . && git commit && git push'
alias gcl='git clone'
alias vim='nvim'
alias l='exa'
alias la='exa -a'
alias ll='exa -l'
alias lla='exa -la'
