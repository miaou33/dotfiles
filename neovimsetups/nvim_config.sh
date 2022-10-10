#!/bin/bash

# cd ~
# git clone https://github.com/neovim/neovim
# cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo 
# sudo make install

if [ ! -d "~/.config/nvim" ] ;
then
	mkdir -p ~/.config/nvim && mkdir -p ~/.config/nvim/syntax
fi

cp init.vim ~/.config/nvim/
cp syntax/*.vim ~/.config/nvim/syntax/

export PATH="$HOME/neovim/bin:$PATH"

# uninstall
# sudo cmake --build build/ --target uninstall

