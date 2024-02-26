#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# colors
darkgrey="$(tput bold ; tput setaf 0)"
white="$(tput bold ; tput setaf 7)"
blue="$(tput bold; tput setaf 4)"
cyan="$(tput bold; tput setaf 6)"
nc="$(tput sgr0)"


PS1='[\u@\h \W]\$ '
#if [[ $EUID -eq 0 ]]; then
#  export PS1="\[$blue][ \[$cyan\]\H \[$darkgrey\]\w\[$darkgrey\] \[$blue\]]\\[$darkgrey\]# \[$nc\]"
#else
#  export PS1="\[$blue\u@\h\][ \[$cyan\]\H \[$darkgrey\]\w\[$darkgrey\] \[$blue\]]\\[$cyan\]\$ \[$nc\]"
#fi


# exports
export EDITOR="nvim"

# alias
alias gcl='git clone'
alias grep='grep --color=auto'
alias ls='exa'
alias la='exa -a'
alias ll='exa -l'
alias lla='exa -la'
alias vim='nvim'
alias vi='vim'

# source files
[ -r /usr/share/bash-completion/completions ] &&
  . /usr/share/bash-completion/completions/*

