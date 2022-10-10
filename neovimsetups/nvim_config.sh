#!/bin/bash

git clone https://github.com/neovim/neovim
rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
export PATH="$HOME/neovim/bin:$PATH"

# uninstall
# sudo cmake --build build/ --target uninstall

