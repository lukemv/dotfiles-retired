# Color prompt
force_color_prompt=yes

# Alias's and stuff
alias ls='ls -allh'

# Returncode.
function returncode
{
  returncode=$?
  if [ $returncode != 0 ]; then
    echo "[$returncode]"
  else
    echo ""
  fi
}

# Prompt.
if [ "$BASH" ]; then
  if [ "`id -u`" -eq 0 ]; then
    # The root prompt is red.
    PS1='\[\033[0;31m\]\u@\h:\w >\[\033[0;37m\] '
  else
    # PS1='\u@\h:\w > '
    PS1='\[\033[0;31m\]$(returncode)\[\033[0;37m\]\[\033[0;35m\]\u@\h\[\033[0;37m\]:\[\033[0;36m\]\w\[\033[0;37m\] > '
  fi
else
  if [ "`id -u`" -eq 0 ]; then
    PS1='# '
  else
    PS1='$ '
  fi
fi

export PS1

# Whenever displaying the prompt, write the previous line to .bash_history.
PROMPT_COMMAND='history -a'

# Bash Options
set -o notify

# Security.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

# Typos
alias celar=clear

# Path.
PATH="/usr/bin:/bin:/usr/bin/X11:/usr/sbin:/sbin:/usr/games"
PATH="$PATH:/usr/local/bin:/usr/local/sbin"
export PATH



