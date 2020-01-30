if grep -q "Microsoft" /proc/version; 
then
   export WSL=1
   export DOCKER_HOST="tcp://localhost:2375"/
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -d $HOME/.nvm ]
then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

set -o vi

export LS_OPTIONS='--color=auto'

# Custom commands go here
export SCRIPTS="$HOME/.scripts"

export GOROOT="/usr/local/go"
export GOPATH="$HOME/code/"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="$SCRIPTS:$PATH"