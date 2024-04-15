#!/bin/zsh

DOTFILES_PATH="$HOME/.dot/dotfiles"

create_symlink() {
	if [ -e "$2" ]; then
		rm -rf "$2"
	fi
	ln -s "$1" "$2" || echo "Failed to create symlink for $2"
}

# ::::::::::::::::::::::::::::::::::::: $HOME

create_symlink "$DOTFILES_PATH/.i3"					"$HOME/.i3"
create_symlink "$DOTFILES_PATH/.fehbg"				"$HOME/.fehbg"
create_symlink "$DOTFILES_PATH/.monitor_display.sh" "$HOME/.monitor_display.sh"
create_symlink "$DOTFILES_PATH/.vimrc"				"$HOME/.vimrc"
create_symlink "$DOTFILES_PATH/.zshrc"				"$HOME/.zshrc"

# ::::::::::::::::::::::::::::: $HOME/.config

create_symlink "$DOTFILES_PATH/.config/conky"		"$HOME/.config/conky"
create_symlink "$DOTFILES_PATH/.config/dunst"		"$HOME/.config/dunst"
create_symlink "$DOTFILES_PATH/.config/nvim"		"$HOME/.config/nvim"
create_symlink "$DOTFILES_PATH/.config/picom"		"$HOME/.config/picom"
create_symlink "$DOTFILES_PATH/.config/polybar"		"$HOME/.config/polybar"
create_symlink "$DOTFILES_PATH/.config/terminator"	"$HOME/.config/terminator"
create_symlink "$DOTFILES_PATH/.config/xfce4"		"$HOME/.config/xfce4"

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf $HOME/.zshrc
ln -s $DOTFILES_DIR/.zshrc $HOME/.zshrc
source $HOME/.zshrc

# Terminator
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
cp -R $DOTFILES_DIR/.config/terminator/config $HOME/.config/terminator/