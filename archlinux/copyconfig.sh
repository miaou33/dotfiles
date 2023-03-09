#!/bin/bash

DOT_PATH=/home/meow/repos/MINE/CONFiiG/archlinux/dotfiles
BAKUPS_PATH=/home/meow/repos/MINE/CONFiiG/archlinux/dotfilesbakups

#TO CKEK IF OK : option dry ryn
#rsync -avH --dry-run $DOT_PATH $BAKUPS_PATH/"$(date +'%Y-%m-%d_%H-%M')"
#rsync -avH $DOT_PATH $BAKUPS_PATH/"$(date +'%Y-%m-%d_%H-%M')"

### i3CONFIG ###
cp -v ~/.config/i3/config $DOT_PATH/.config/i3/config

### PICOM ###
cp -v ~/.config/picom/picom.conf $DOT_PATH/.config/picom/

### ALACRITTY ###
cp -v ~/.config/alacritty/alacritty.yml $DOT_PATH/.config/alacritty/

### DUNST ###
cp -v ~/.config/dunst/dunstrc $DOT_PATH/.config/dunst/

### Polybar ###
cp -rv ~/.config/polybar/* $DOT_PATH/.config/polybar/

### ZSH ###
cp -v ~/.zshrc $DOT_PATH/.zshrc
cp -v ~/.p10k.zsh $DOT_PATH/.p10k.zsh

### VIM / NVIM ###
#cp -v ~/.vimrc $DOT_PATH/.vimrc
#cp -v nvimmmmm

### FEHBG ###
#cp -v ~/.fehbg $DOT_PATH/.fehbg

### LIGHTDM ###
#cp -v  /etc/lightdm/lightdm.conf $DOT_PATH/etc/lightdm/lightdm.conf
#cp -v  /etc/lightdm/slick-greeter.conf $DOT_PATH/etc/lightdm/slick-greeter.conf

### Accessories (mouse, touchpad, keyboard, ...) ###
#cp -v /usr/local/sbin/lightdm-setup.sh DOT_PATH/usr/local/sbin/lightdm-setup.sh
#cp -vR /etc/X11/xorg.conf.d/* DOT_PATH/etc/X11/xorg.conf.d/



