export HISTCONTROL=ignoredups:erasedups:ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

if [ -f /proc/version ]
then
  # When the shell exits, append to the history file instead of overwriting it
  shopt -s histappend
fi