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
create_symlink "$DOTFILES_PATH/.profile"			"$HOME/.profile"
create_symlink "$DOTFILES_PATH/.vimrc"				"$HOME/.vimrc"
create_symlink "$DOTFILES_PATH/.Xclients"			"$HOME/.Xclients"
create_symlink "$DOTFILES_PATH/.Xresources"			"$HOME/.Xresources"
create_symlink "$DOTFILES_PATH/.zshrc"				"$HOME/.zshrc"

# ::::::::::::::::::::::::::::: $HOME/.config

create_symlink "$DOTFILES_PATH/.config/conky"		"$HOME/.config/conky"
create_symlink "$DOTFILES_PATH/.config/dunst"		"$HOME/.config/dunst"
create_symlink "$DOTFILES_PATH/.config/nvim"		"$HOME/.config/nvim"
create_symlink "$DOTFILES_PATH/.config/picom"		"$HOME/.config/picom"
create_symlink "$DOTFILES_PATH/.config/polybar"		"$HOME/.config/polybar"
create_symlink "$DOTFILES_PATH/.config/terminator"	"$HOME/.config/terminator"
create_symlink "$DOTFILES_PATH/.config/xfce4"		"$HOME/.config/xfce4"