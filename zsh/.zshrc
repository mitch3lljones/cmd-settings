#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mitchelljones/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mitchelljones/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mitchelljones/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mitchelljones/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# load vcs_info for info on terminal prompt
autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying prompt
zstyle ':vcs_info:*' formats ' %s(%b)' # git(main)

# set terminal prompt
export DEFAULT_USER="$(whoami)"
setopt prompt_subst
PS1='%n@%m %~%f${vcs_info_msg_0_} $ '

# set r home
export R_HOME=/Library/Frameworks/R.framework/Resources/

# set default text editor
EDITOR=vim

# set go environment
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# load zsh aliases file if it exists
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi
