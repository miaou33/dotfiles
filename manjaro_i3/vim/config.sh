#!/bin/bash

comment=$'\033[0;30m'
red=$'\033[0;31m'
green=$'\033[0;32m'
orange=$'\033[0;33m'
blue=$'\033[34m'
purple=$'\033[1;35m'
boldlightgreen=$'\033[1;36m'
boldbeige=$'\033[1;37m'
#eight=$'\033[1;38m' same as boldbeige
boldlightblue=$'\033[1;39m'
reset=$'\033[0m'

# SETUP .VIM - NERDTREE - COLORS

if [ -d "~/.vim" ];
then
	if [ "~/.vim/pack/vendor/start/nerdtree" ];
		then
			echo "NerdTree already installed !$reset"
		else
			echo "installing nerdtree...$reset"
			mkdir -p ~/.vim/autoload ~/.vim/backup ~/.vim/plugged ~/.vim/bundle
			mkdir -p ~/.vim/pack/vendor/start
			git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
	fi
else
	mkdir -p -v ~/.vim ~/.vim/colors ~/.vim/autoload ~/.vim/backup ~/.vim/plugged ~/.vim/bundle
    echo "installing nerdtree...$reset"
	mkdir -p ~/.vim/pack/vendor/start
	git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
fi

#if [ "~/.vim/colors/eva.vim" ];
#then
#    echo "${boldlightgreen}Backing current eva.vim to replace it by the new one$reset"
#    mv ~/.vim/colors/eva.vim ./.eva.bak
#    cp ./eva.vim ~/.vim/colors/
#    echo "${purple}Backed to current dir$reset"
#fi
#    cp ./eva.vim ~/.vim/colors/



#===SETUP VIMRC===

if [ "~/.vimrc" ];
then
	echo "Backing up current vimrc config to replace it by the new one$reset"
	mv ~/.vimrc ~/CONFiiG/manjaro_i3/vim/.vimrc.bak
	echo "Backed to current directory$reset"
fi
    cp .vimrc ~/.vimrc

echo "VIM SETUPS UPDATED$reset"


#ls /usr/share/vim/vim82/colors | grep .vim

