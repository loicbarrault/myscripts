#! /bin/bash

CWD=`pwd`
echo "CWD=$CWD"

# GENERIC STUFF
cp -R dotfiles ~/.dotfiles

# VIM STUFF
if [ -e ~/vim ]; then
  mv ~/.vim ~/.vim.bckp
  echo "~/.vim already exist... moved to ~/.vim.bckp"
fi
cp -R vim ~/.vim

# BASH STUFF
# cp ./bash/.*  ~/.dotfiles

#ZSH STUFF
cp zsh/.Xresources ~/
cp zsh/.zshrc ~/

cp -R i3 ~/

if [ $# -gt 0 ]; then
  echo "ARG: $1"
  ln -s $CWD/bash/.$1 ~/.$1
fi





