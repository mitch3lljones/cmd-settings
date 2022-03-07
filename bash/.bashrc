# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#shopt -s histappend
#PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
#shopt -s checkwinsize

# If set, the patter "**" used in a pathname expansion content will
# match all files and zero or more directories and subdirectories
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL="/bin/sh lesspipe)"


# set title
PS1="[\d \t \u@\h:\w\a]$PS1"

# enable color support of ls
#if [ -x /usr/bin/dircolors ]; then
#	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#fi

# Start zsh shell if not already in
# exec zsh

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Export path for google cloud sdk
export PATH="/usr/lib/google-cloud-sdk/bin:$PATH"

# Export go environment variables
export GOROOT=/usr/local/go
export PATH=$PATH:$(go env GOROOT)/bin
