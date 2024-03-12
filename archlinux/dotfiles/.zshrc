# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"

#eval "$(oh-my-posh --init --shell zsh --config ~/.zsh_omp_themes/cleaned-detailed.omp.json)"
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
