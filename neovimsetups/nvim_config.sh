#!/bin/bash

cd ~
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo 
# sudo make install

if [ ! -d "~/.config/nvim" ] ;
then
	mkdir -p ~/.config/nvim ~/.config/nvim/syntax ~/.config/nvim/pack 
fi

cd SETUPFiiLES/neovimsetups

cp -R init.vim ~/.config/nvim/
cp -R syntax/*.vim ~/.config/nvim/syntax/

# uninstall
# sudo cmake --build build/ --target uninstall

