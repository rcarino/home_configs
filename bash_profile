# ls and cd in one command
cl()
{
cd $1 && ls
}

# terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# terminal prompt
export PS1="\u:\W$ "

# Use most up to date version of emacs
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

# Gain access to go
PATH=$PATH:/usr/local/go/bin