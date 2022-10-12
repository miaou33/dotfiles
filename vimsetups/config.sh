#!/bin/bash

orange=$'\033[0;33m'
lightPurple=$'\033[0;34m'
DarkGrey=$'\033[34m'
bblue=$'\033[1;32m'
reset=$'\033[0m'

# SETUP .VIM - NERDTREE - COLORS

if [ ! -d "~/.vim" ];
then
	mkdir -p -v ~/.vim ~/.vim/colors
    echo "/!\ Plugins needs to be installed. see commented lines in script"
fi

if [ "./eva.vim" -ef "~/.vim/colors/eva.vim" ];
then
    echo "Backing current colorscheme "
    mv ~/.vim/colors/eva.vim ./eva.bak
    cp ./eva.vim ~/.vim/colors/
    echo "Backed to current dir"
fi
    cp ./eva.vim ~/.vim/colors/
    
# mkdir -p ~/.vim/autoload ~/.vim/backup ~/.vim/plugged ~/.vim/bundle
# mkdir -p ~/.vim/pack/vendor/start
# git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# cd ~/.vim/bundle && git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
# THEN RESTART VIM

#===SETUP VIMRC===

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

