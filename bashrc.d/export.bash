
export HISTCONTROL=ignoredups:erasedups:ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

export GOROOT="/usr/local/go"
export GOPATH="$HOME/code/go"

export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

set -o vi

