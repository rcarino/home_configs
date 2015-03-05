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