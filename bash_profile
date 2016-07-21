#!/bin/bash

# ls and cd in one command
cl()
{
cd $1 && ls
}

# terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Use most up to date version of emacs
MAC_EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
if [ -e $MAC_EMACS ]
then
    alias emacs="$MAC_EMACS -nw"
fi

# Gain access to go
PATH=$PATH:/usr/local/go/bin
# Go env vars
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# terminal prompt mod
export PS1="\u:\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# use emacs for programs that spawn an editor
export VISUAL=emacs
export EDITOR="$VISUAL"

# register global gitignore file to git
git config --global core.excludesfile '~/.gitignore'

# git autocomplete
if [ -f ~/home_configs/git-completion.bash ]; then
    source ~/home_configs/git-completion.bash
fi

# name tabs and windows
function tabname {
  printf "\e]1;$1\a"
}
function winname {
  printf "\e]2;$1\a"
}

# allow ctrl + s in mac
stty -ixon


#eval "$(docker-machine env default)" # make docker commands work via magic?

eval "$(nodenv init -)"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Allows projects to source the .env file
source /usr/local/opt/autoenv/activate.sh

function init-docker {
    source '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
}

export PATH=~/bin:$PATH
