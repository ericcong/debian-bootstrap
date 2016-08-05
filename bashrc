# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return ;;
esac

# History config
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Check window size after each command
shopt -s checkwinsize

PS1='\n\w \$ '

PATH=$PATH:$HOME/.bin
set -o vi

alias ll='ls -lh'
alias lll='ls -lah'
alias q='exit'
alias d='cd ~/Desktop/'