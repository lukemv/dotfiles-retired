# .bashrc
if [[ $- != *i* ]] ; then
  # shell is non-interactive. be done now!
  return
fi

# Load all files from .shell/bashrc.d directory
if [ -d $HOME/.bashrc.d ]; then
  for file in $HOME/.bashrc.d/*.bash; do
    source $file
  done
  echo "sourced all the things"
fi
