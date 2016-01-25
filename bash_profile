# ls and cd in one command
cl()
{
cd $1 && ls
}

# terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Use most up to date version of emacs
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

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

# ssh into work dev computer
sshwk() {
    ssh -t ubuntu@ray-dev 'cd Projects/mba-sdmain/src/web && exec bash -l'
}

# register global gitignore file to git
git config --global core.excludesfile '~/.gitignore'

# add arcanist if it exists
ARC_PATH="~/bin/arc/arcanist/bin"
PATH=$PATH:$ARC_PATH

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
