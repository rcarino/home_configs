#!/bin/bash
cd ~
ln -sf home_configs/bash_profile .bash_profile
ln -sf home_configs/gitconfig .gitconfig
ln -sf home_configs/global_gitignore .gitignore
ln -sf home_configs/emacs .emacs

source ~/.bash_profile