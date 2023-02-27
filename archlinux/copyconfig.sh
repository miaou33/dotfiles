#!/bin/bash

DOT_PATH=~/CONFiiG/archlinux/dotfiles

cp $DOT_PATH/.config/i3/config $DOT_PATH/.config/i3/config.bak
cp -v ~/.config/i3/config $DOT_PATH/.config/i3/config

cp $DOT_PATH/.config/picom/picom.conf $DOT_PATH/.config/picom/picom.conf.bak
cp -v ~/.config/picom/picom.conf $DOT_PATH/.config/picom/picom.conf

cp $DOT_PATH/.config/alacritty/alacritty.yml $DOT_PATH/.config/alacritty/alacritty.yml.bak
cp -v ~/.config/alacritty/alacritty.yml $DOT_PATH/.config/alacritty/alacritty.yml

cp $DOT_PATH/.config/polybar/config.ini $DOT_PATH/.config/polybar/config.ini.bak
cp -v ~/.config/polybar/config.ini $DOT_PATH/.config/polybar/config.ini

cp ~/.zshrc $DOT_PATH/.zshrc
cp -v ~/.vimrc $DOT_PATH/.vimrc
cp -v ~/.fehbg $DOT_PATH/.fehbg
cp -v ~/.p10k.zsh $DOT_PATH/.p10k.zsh
sudo cp -v  /etc/lightdm/lightdm.conf $DOT_PATH/root_dir/etc/lightdm/lightdm.conf
sudo cp -v  /etc/lightdm/slick-greeter.conf $DOT_PATH/root_dir/etc/lightdm/slick-greeter.conf


