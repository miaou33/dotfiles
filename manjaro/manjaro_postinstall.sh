#!/bin/bash

sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i '/shortcuts/d' /usr/bin/start_conky_maia

# update & upgrade
yay

# packages
yay -S firefox exa 


ssh-keygen
cat .ssh/id_rsa.pub
echo "\nminimal setup ok. please add ssh key to authorized ones in github then exec config.sh" 
