if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto
#
# Disable marking untracked files under VCS as dirty. This makes repository 
# status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
          git
          zsh-autosuggestions
        )

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## KEYBINDINGS
bindkey -v

# VARIABLES
export PATH="$PATH:$HOME/repos/exa/bin:$HOME/.cargo/bin"
export EDITOR=vim

# ALIASES
alias gcl='git clone'
alias ls='exa -lHS -s type --icons'
alias ll='exa -laHS -s type --icons'
alias cp='cp -v'
alias gita='git add --all && git commit && git push'
alias vi=vim
alias nvim='~/Applications/nvim.appimage'
alias vim=nvim
#
# File and Dir colors for ls and other outputs
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'
