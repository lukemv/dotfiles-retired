
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

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

export GOPATH="$HOME/code/go"
export PATH=$PATH:$GOPATH/bin

set -o vi
