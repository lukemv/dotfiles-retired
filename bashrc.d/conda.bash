
# >>> conda initialize >>>
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    echo "Evaluating conda setup variable"
    eval "$__conda_setup"
else
    echo "Doing the other thing"
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    fi
    export PATH="$HOME/miniconda3/bin:$PATH"
fi
unset __conda_setup
# <<< conda initialize <<<