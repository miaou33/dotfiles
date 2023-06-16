#!/bin/bash

sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i '/shortcuts/d' /usr/bin/start_conky_maia

# update & upgrade
yay

# packages
yay -S firefox terminator neovim nvim-packer-git exa python-pip

# terminator themes
pip install requests
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"

ssh-keygen
cat .ssh/id_rsa.pub
#after adding it to github:
#git clone git@github.com:nfauconn/CONFiiG.git
#rm -rf .i3/config && ln -s CONFiiG/manjaro/.i3/config .i3/config
#cd .config
#rm -rf terminator && ln -s CONFiiG/manjaro/.config/terminator terminator
#rm -rf nvim && ln -s CONFiiG/manjaro/.config/nvim nvim
