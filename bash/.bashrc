
PS1="[\h] \W > "



case "$-" in
   *i*)
        bind -f ~/.bash_key_bindings
esac

export SRILM=$HOME/tools/srilm





#export CUDA_ROOT=/opt/cuda-7.5:$CUDA_ROOT
#export CUDA_ROOT=/opt/cuda-6.5:$CUDA_ROOT
if [ -d "/usr/local/cuda-8.0" ]; then
  export CUDA_ROOT=/usr/local/cuda-8.0
elif [ -d "/opt/cuda-7.5" ]; then
  export CUDA_ROOT=/opt/cuda-7.5
else
  export CUDA_ROOT=/opt/cuda-6.5
fi

# LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib64:/lib:$LD_LIBRAY_PATH
export LD_LIBRARY_PATH=/opt/intel/lib/intel64/:/opt/intel/cc/9.1.042/lib:/opt/intel/Compiler/11.1/046/lib/intel64/:/opt/intel/Compiler/11.1/046/mkl/lib/em64t:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$CUDA_ROOT/lib64:/opt/CUDNN/cudnn-v5.1/lib64:$LD_LIBRARY_PATH

export LIBRARY_PATH=/opt/CUDNN/cudnn-v5.1/lib64:$LIBRARY_PATH
export CPATH=/opt/CUDNN/cudnn-v5.1/include:$CPATH
export MKL_ROOT=/opt/intel/composer_xe_2013_sp1.2.144

export PATH=$CUDA_ROOT/bin:$HOME/tools/srilm_1.7.0/bin/i686-m64/:/usr/local/jdk1.6.0_10/jre/bin/:/usr/local/maui/bin:$HOME/bin:$HOME/bin/linux:$HOME/bin/mt:$HOME/src/mt-scripts:$HOME/scripts:$PATH

#export LANG=C sort
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8

#export LS_COLORS=`dircolors -b /lium/buster1/barrault/.ls_colors`
eval `dircolors $HOME/.ls_colors`
export LS_OPTIONS="-b --color=auto"


case "$TERM" in
xterm*|rxvt*)
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
#PROMPT_COMMAND='echo -ne "\ek${PWD/$HOME/~}\007\e\\"'
;;
#screen*)
#PROMPT_COMMAND='echo -ne "\ek`$HOME/myprompt_command.sh`\e\\"'
#;;
*)
;;
esac


HISTCONTROL=ignoreboth

umask 027

pushd()
{
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi

  builtin pushd "${DIR}" > /dev/null
  #echo -n "DIRSTACK: "
  #dirs
}

pushd_builtin()
{
  builtin pushd > /dev/null
  #echo -n "DIRSTACK: "
  #dirs
}

popd()
{
  builtin popd > /dev/null
  #echo -n "DIRSTACK: "
  #dirs
}

showd()
{
    echo -n "DIRSTACK: "
    dirs
}

alias cd='pushd'
alias b='popd'
alias flip='pushd_builtin'
alias sd='showd'

export EDITOR='vim'


source activate nmtpy 2> /dev/null

source ~/tools/cluster-rc/bashrc
source ~/.bash_aliases

if [ -f "~/.lemans" ]; then
  source ~/.lemans
elif [ -f "~/.sheffield" ]; then
  source ~/.sheffield
fi






