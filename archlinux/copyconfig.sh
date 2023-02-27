#!/bin/bash

DOT_PATH=~/CONFiiG/archlinux/dotfiles
ROOT_DOT_PATH=~/CONFiiG/archlinux/dotfiles/root_dir/

# i3config
cp $DOT_PATH/.config/i3/config $DOT_PATH/.config/i3/config.bak
cp -v ~/.config/i3/config $DOT_PATH/.config/i3/config

# Picom
cp $DOT_PATH/.config/picom/picom.conf $DOT_PATH/.config/picom/picom.conf.bak
cp -v ~/.config/picom/picom.conf $DOT_PATH/.config/picom/picom.conf

# Alacritty
cp $DOT_PATH/.config/alacritty/alacritty.yml $DOT_PATH/.config/alacritty/alacritty.yml.bak
cp -v ~/.config/alacritty/alacritty.yml $DOT_PATH/.config/alacritty/alacritty.yml

# Polybar
cp $DOT_PATH/.config/polybar/config.ini $DOT_PATH/.config/polybar/config.ini.bak
cp -v ~/.config/polybar/config.ini $DOT_PATH/.config/polybar/config.ini

# Zsh
cp $DOT_PATH/.zshrc $DOT_PATH/.zshrc.bak
cp ~/.zshrc $DOT_PATH/.zshrc
cp $DOT_PATH/.p10k.zsh $DOT_PATH/.p10k.zsh.bak
cp -v ~/.p10k.zsh $DOT_PATH/.p10k.zsh

# Vim
cp $DOT_PATH/.vimrc $DOT_PATH/.vimrc.bak
cp -v ~/.vimrc $DOT_PATH/.vimrc

# Fehbg
cp $DOT_PATH/.fehbg $DOT_PATH/.fehbg.bak
cp -v ~/.fehbg $DOT_PATH/.fehbg

# Lightdm
cp $ROOT_DOT_PATH/etc/lightdm/lightdm.conf $ROOT_DOT_PATH/etc/lightdm/lightdm.conf.bak
sudo cp -v  /etc/lightdm/lightdm.conf $ROOT_DOT_PATH/etc/lightdm/lightdm.conf
cp $ROOT_DOT_PATH/etc/lightdm/slick-greeter.conf $ROOT_DOT_PATH/etc/lightdm/slick-greeter.conf.bak
sudo cp -v  /etc/lightdm/slick-greeter.conf $ROOT_DOT_PATH/etc/lightdm/slick-greeter.conf


