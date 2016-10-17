# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return ;;
esac

# History config
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

# Check window size after each command
shopt -s checkwinsize

PS1='\n\w \$ '

PATH=$PATH:$HOME/.bin

set -o vi
export VISUAL=vim
export EDITOR="$VISUAL"

export TERM='linux'

alias ll='ls -lh'
alias lll='ls -lah'
alias q='exit'
alias lstodo="grep -r TODO ."

open() {
  ( xdg-open "$@" & ) > /dev/null 2>&1
}

# Stack >>>

STACK_DIR="$HOME/Stack"

alias list="ls -c $STACK_DIR | nl -nln"
alias empty="rm -rf $STACK_DIR/* > /dev/null 2>&1" 

ditch() {
  filename=$(ls -c $STACK_DIR | sed -n "${1:-1}p")
  if [ ! -z $filename ]; then
    rm "$STACK_DIR/$filename"
  fi
}

pop() {
  filename=$(ls -c $STACK_DIR | sed -n "${1:-1}p")
  if [ ! -z $filename ]; then
    mv "$STACK_DIR/$filename" ./
  fi
}

push() {
  if [ ! -z $1 ]; then
    mv "./$1" "$STACK_DIR"
  fi
}

# <<< Stack