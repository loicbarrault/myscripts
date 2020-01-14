test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

alias vi='vim'
alias tmux="TERM=screen-256color tmux"
alias ls='ls --color=auto'
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias bd='. bd -si'

alias news="cd /lium/raid01_a/projets/wmt/2018/news"
alias mmt="cd /lium/raid01_a/projets/wmt/2018/multimodal"
alias cag="cd /lium/raid01_a/caglayan"
alias hsync="history -a; history -n;"
#alias si="sinfo -o '%8P %10n %.11T %.4c %.8z %.6m %12G %10l %10L %10O %5h %20E' -S '-O'"
#alias sq="squeue -o \"%8i %10u %10P %20j %4t %5D %20R %7b %3C %11l %11L %V\""


alias h='history'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -l --color'
alias ll='ls -glrth --color'
alias la='ls -aglrth --color'
alias lt='ls -lt'
alias ltm='ls -lt | more'

#SLURM
alias si='sinfo -o '\''%8P %10n %.11T %.4c %.8z %.6m %12G %10l %10L %10O %20E'\'' -S '\''-P'\'''
alias sic='si -p cpu'
alias sig='si -p gpu'
alias sq='squeue -Su -o '\''%8i %10u %40j %4t %5D %20R %15b %3C %7m %11l %11L %V'\'''
alias sqc='sq -p cpu'
alias sqg='sq -p gpu'
alias sst='sstat --format=JobID,NTasks,AveCPU,AveCPUFreq,AveRSS,MaxRSS -j'
alias sinter1080='srun -p gpu --gres gpu:1080ti:1 --mem 6G --pty bash'
alias sinterk40='srun -p gpu --gres gpu:k40:1 --mem 6G --pty bash'
alias sintercpu='srun -p cpu --mem 10G --pty bash'


#QSUB
#alias qsu='qstat -a -u barrault'
#alias qsa='qstat -an'
#alias qsau='qstat -an -u barrault'
#alias qsf='qstat -f'
#alias qs='qstat -a'

#NVIDIA
alias nv='nvidia-smi'

alias psu='ps -u barrault'
alias cls='clear'

# PYTHON
alias listenv='conda info --envs'

alias py27='source activate py27'
alias py3='source activate py3'
alias dev='source activate nmtpy-dev'




#MARCC
alias multiplex='ssh -fNM login-node02.marcc.jhu.edu -l lbarrau1@jhu.edu'
alias node02='ssh login-node02.marcc.jhu.edu -l lbarrau1@jhu.edu'

alias notebook='srun --mem 10G ~/.cluster-rc/bin/slurm-jupyter'

