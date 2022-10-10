#!/bin/bash

orange=$'\033[0;33m'
lightPurple=$'\033[0;34m'
DarkGrey=$'\033[34m'
bblue=$'\033[1;32m'
reset=$'\033[0m'

# SETUP .VIM - NERDTREE - COLORS

if [ ! -d "~/.vim" ];
then
	mkdir -p -v ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
	mkdir -p ~/.vim/pack/vendor/start
else
    echo "/!\ NERDTree needs to be installed. Please decomment line 28 - 29"
fi

if [ "./eva.vim" -ef "~/.vim/colors/eva.vim" ];
then
    echo "Backing current colorscheme "
    mv ~/.vim/colors/eva.vim ./eva.bak
    cp ./eva.vim ~/.vim/colors/
    echo "Backed to current dir"
fi
    cp ./eva.vim ~/.vim/colors/
    
# echo "Cloning NERDTree repo"
# git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree

# SETUP VIMRC

if [ ".vimrc" -ef "~/.vimrc" ];
then
	echo "Backing up current vimrc config "
	mv ~/.vimrc ./.vimrc.bak
	echo "Backed to current directory "
fi
    cp .vimrc ~/.vimrc

cd ~
echo "VIM SETUPS UPDATED "


#ls /usr/share/vim/vim82/colors | grep .vim

