
alias rc="source ~/.bashrc"

export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls -allh $LS_OPTIONS'

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/lukem/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/lukem/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lukem/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/lukem/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
