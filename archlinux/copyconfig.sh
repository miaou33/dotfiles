#!/bin/bash

DOT_PATH=/home/meow/repos/MINE/CONFiiG/archlinux/dotfiles
BAKUPS_PATH=/home/meow/repos/MINE/CONFiiG/archlinux/dotfilesbakups

#/!\ BACKUPPPPPP
#>>>>> TO CHEK IF OK : option dry run
#rsync -avH --dry-run $DOT_PATH $BAKUPS_PATH/"$(date +'%Y-%m-%d_%H-%M')"
#rsync -avH $DOT_PATH $BAKUPS_PATH/"$(date +'%Y-%m-%d_%H-%M')"

### i3CONFIG ###
cp -v ~/.config/i3/config $DOT_PATH/.config/i3/config

### APPS ###
cp -v ~/.config/picom/picom.conf $DOT_PATH/.config/picom/
#cp -v ~/.config/alacritty/alacritty.yml $DOT_PATH/.config/alacritty/
#cp -v ~/.config/dunst/dunstrc $DOT_PATH/.config/dunst/
#cp -rv ~/.config/polybar/* $DOT_PATH/.config/polybar/
#cp -v ~/.config/mimeapps.list $DOT_PATH/.config/mimeapps.list

### SHELL / EDITOR ###
cp -v ~/.zshrc $DOT_PATH/.zshrc
#cp -v ~/.p10k.zsh $DOT_PATH/.p10k.zsh
#cp -v ~/.vimrc $DOT_PATH/.vimrc
cp -rv ~/.config/nvim/* $DOT_PATH/.config/nvim/

### DISPLAY ###
#cp -v ~/.fehbg $DOT_PATH/.fehbg
#cp -v ~/monitor_display.sh $DOT_PATH/monitor_display.sh

### SYSTEM ###
#cp -v  /etc/lightdm/lightdm.conf $DOT_PATH/etc/lightdm/lightdm.conf
#cp -v  /etc/lightdm/slick-greeter.conf $DOT_PATH/etc/lightdm/slick-greeter.conf
#cp -v /usr/local/sbin/lightdm-setup.sh DOT_PATH/usr/local/sbin/lightdm-setup.sh
#cp -vR /etc/X11/xorg.conf.d/* DOT_PATH/etc/X11/xorg.conf.d/



