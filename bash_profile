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
    echo 'I ran'
    alias emacs="$MAC_EMACS -nw"
fi

# Gain access to go
PATH=$PATH:/usr/local/go/bin

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
    ssh -t ubuntu@ray-dev 'cd Projects/sdmain && exec bash -l'
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

# allow ctrl + s
stty -ixon

# work dirs
alias wdevscripts='cd ~/Projects/local-sdmain/src/scripts/dev'
alias wwebsrc='cd ~/Projects/local-sdmain/src/web'
alias wdeployment='cd ~/Projects/local-sdmain/deployment'
alias wjavasrc='cd ~/Projects/local-sdmain/src/java/sd'