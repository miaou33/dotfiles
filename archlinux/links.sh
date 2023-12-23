#!/bin/zsh

mv dotfiles .dot

DOTFILES_PATH="$HOME/.dot/archlinux/dotfiles"

# ::::::::::::::::::::::::::::::::::::: $HOME

rm -rf $HOME/.i3
ln -s $DOTFILES_PATH/.i3 $HOME/.i3

rm $HOME/.fehbg
ln -s $DOTFILES_PATH/.fehbg $HOME/.fehbg

rm $HOME/.monitor_display.sh
ln -s $DOTFILES_PATH/.monitor_display.sh $HOME/.monitor_display.sh

rm $HOME/.profile
ln -s $DOTFILES_PATH/.profile $HOME/.profile

rm $HOME/.vimrc
ln -s $DOTFILES_PATH/.vimrc $HOME/.vimrc

rm $HOME/.Xclients
ln -s $DOTFILES_PATH/.Xclients $HOME/.Xclients

rm $HOME/.Xresources
ln -s $DOTFILES_PATH/.Xresources $HOME/.Xresources

rm $HOME/.zshrc
ln -s $DOTFILES_PATH/.zshrc $HOME/.zshrc


# ::::::::::::::::::::::::::::: $HOME/.config

rm $HOME/.config/conky
ln -s $DOTFILES_PATH/.config/conky $HOME/.config/conky

rm $HOME/.config/dunst
ln -s $DOTFILES_PATH/.config/dunst $HOME/.config/dunst

rm $HOME/.config/nvim
ln -s $DOTFILES_PATH/.config/nvim $HOME/.config/nvim

rm $HOME/.config/picom
ln -s $DOTFILES_PATH/.config/picom $HOME/.config/picom

rm $HOME/.config/polybar
ln -s $DOTFILES_PATH/.config/polybar $HOME/.config/polybar

rm $HOME/.config/terminator
ln -s $DOTFILES_PATH/.config/terminator $HOME/.config/terminator

rm $HOME/.config/xfce4
ln -s $DOTFILES_PATH/.config/xfce4 $HOME/.config/xfce4


