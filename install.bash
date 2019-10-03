#! /bin/bash

CWD=`pwd`
echo "CWD=$CWD"

ln -s $CWD/bash/.bashrc ~/.bashrc
ln -s $CWD/bash/.bash_aliases ~/.bash_aliases
ln -s $CWD/bash/.ls_colors ~/.ls_colors

if [ $# -gt 0 ]; then
  echo "ARG: $1"
  ln -s $CWD/bash/.$1 ~/.$1
fi

