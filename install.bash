#! /bin/bash

CWD=`pwd`
echo "CWD=$CWD"

# GENERIC STUFF
cp -R dotfiles ~/.dotfiles

# VIM STUFF
if [ -e ~/.vim ]; then
  mv ~/.vim ~/.vim.bckp
  echo "~/.vim already exists... moved to ~/.vim.bckp"
fi
cp -R vim ~/.vim

if [ -e ~/.jupyter ]; then
  mv ~/.jupyter  ~/.jupyter.bckp
  echo "~/.jupyter already exists... moved to ~/.jupyter.bckp"
fi
ln -s ~/.dotfiles/jupyter ~/.jupyter

# BASH STUFF
cp ./bash/.*  ~/.dotfiles

#ZSH STUFF
#cp zsh/.Xresources ~/

#cp -R i3 ~/

cp -R bin ~/

if [ $# -gt 0 ]; then
  echo "ARG: $1"
  ln -s $CWD/bash/.$1 ~/.$1
fi





