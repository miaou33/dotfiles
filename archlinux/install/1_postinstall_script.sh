#!/bin/bash

#enable trim to preservce SSD
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

sudo pacman -Syu
sudo pacman -Syu git

git config --global user.email "nfauconn@student.42.fr"
git config --global user.name "no3"

ssh-keygen

