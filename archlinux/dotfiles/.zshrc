
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# DISABLE_MAGIC_FUNCTIONS="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# HIST_STAMPS="mm/dd/yyyy"

plugins=(
	colored-man-pages
	sudo	
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh --init --shell zsh --config ~/.zsh_omp_themes/cleaned-detailed.omp.json)"

## Environment section
export DOTFILES_DIR="$HOME/.dot/archlinux/dotfiles"
export EDITOR=nvim
export TERMINAL=alacritty
export XDG_CONFIG_HOME="$HOME/.config"

## Keybindings section
bindkey -v

## Alias section
alias gita='git add . && git commit && git push'
alias gcl='git clone'
alias vim='nvim'
alias l='exa'
alias la='exa -a'
alias ll='exa -l'
alias lla='exa -la'
