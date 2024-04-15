#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_prompt.sh ]; then
  . ~/.bash_prompt.sh
fi

# exports
#export EDITOR="nvim"

# alias
alias gcl='git clone'
alias grep='grep --color=auto'
alias ls='exa'
alias la='exa -a'
alias ll='exa -l'
alias lla='exa -la'

# source files
[ -r /usr/share/bash-completion/completions ] &&
  . /usr/share/bash-completion/completions/*

