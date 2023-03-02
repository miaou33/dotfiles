#!/bin/bash

DOT_PATH=~/CONFiiG/archlinux/dotfiles
BAKUPS_PATH=~/CONFiiG/archlinux/dotfiles/bakups

# i3config
rsync -avH $DOT_PATH/.config/i3/config $BAKUPS_PATH/.config/i3/"config_$(date +'%Y-%m-%d_%H-%M').bak"
cp -v ~/.config/i3/config $DOT_PATH/.config/i3/config

# Picom
#rsync -avH $DOT_PATH/.config/picom/picom.conf $BAKUPS_PATH/.config/picom/"picom.conf_$(date +'%Y-%m-%d_%H-%M').bak"
#cp -v ~/.config/picom/picom.conf $DOT_PATH/.config/picom/picom.conf

# Alacritty
#rsync -avH $DOT_PATH/.config/alacritty/alacritty.yml $BAKUPS_PATH/.config/alacritty/"alacritty.yml_$(date +'%Y-%m-%d_%H-%M').bak"
#cp -v ~/.config/alacritty/alacritty.yml $DOT_PATH/.config/alacritty/alacritty.yml

# Dunst
rsync -avH $DOT_PATH/.config/dunst/dunstrc $BAKUPS_PATH/.config/dunst/dunstrc.bak
rsync ~/.config/dunst/dunstrc $DOT_PATH/.config/dunst/dunstrc

# Polybar
rsync -avH $DOT_PATH/.config/polybar/* $BAKUPS_PATH/.config/polybar/"$(date +'%Y-%m-%d_%H-%M').bak"
rsync -r ~/.config/polybar/* $DOT_PATH/.config/polybar/

# Zsh
#rsync -avH $DOT_PATH/.zshrc $BAKUPS_PATH/".zshrc_$(date +'%Y-%m-%d_%H-%M').bak"
#cp ~/.zshrc $DOT_PATH/.zshrc
#rsync -avH $DOT_PATH/.p10k.zsh $BAKUPS_PATH/".p10k.zsh_$(date +'%Y-%m-%d_%H-%M').bak"
#cp -v ~/.p10k.zsh $DOT_PATH/.p10k.zsh

# Vim
#rsync -avH $DOT_PATH/.vimrc $BAKUPS_PATH/".vimrc_$(date +'%Y-%m-%d_%H-%M').bak"
#cp -v ~/.vimrc $DOT_PATH/.vimrc

# Fehbg
#rsync -avH $DOT_PATH/.fehbg $BAKUPS_PATH/".fehbg_$(date +'%Y-%m-%d_%H-%M').bak"
#cp -v ~/.fehbg $DOT_PATH/.fehbg

# Lightdm
#rsync -avH $DOT_PATH/etc/lightdm/lightdm.conf $BAKUPS_PATH/etc/lightdm/"lightdm.conf_$(date +'%Y-%m-%d_%H-%M').bak"
#sudo cp -v  /etc/lightdm/lightdm.conf $DOT_PATH/etc/lightdm/lightdm.conf
#rsync -avH $DOT_PATH/etc/lightdm/slick-greeter.conf $BAKUPS_PATH/etc/"lightdm/slick-greeter.conf_$(date +'%Y-%m-%d_%H-%M').bak"
#sudo cp -v  /etc/lightdm/slick-greeter.conf $DOT_PATH/etc/lightdm/slick-greeter.conf


