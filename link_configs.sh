#!/bin/bash

# TODO learn why relative path from home is necessary.
# Why didn't absolute paths work?
cd ~
ln -sf home_configs/bash_profile .bash_profile
ln -sf home_configs/gitconfig .gitconfig
ln -sf home_configs/global_gitignore .gitignore
ln -sf home_configs/emacs .emacs

source ~/.bash_profile
