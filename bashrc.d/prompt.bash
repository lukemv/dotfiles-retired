c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
  gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  if git diff --quiet 2>/dev/null >&2 
  then
    gitver=${c_green}'('$gitver')'${c_sgr0}
  else
    gitver=${c_red}'!('$gitver')'${c_sgr0}
  fi
  else
  return 0
  fi
  echo $gitver
}


promptCommand() {
  if [ $? -eq 0 ]; then
    ERRPROMPT=" "
    HAS_ERROR=0
  else
    ERRPROMPT=" ($?) "
    HAS_ERROR=1
  fi

  # set an error string for the prompt, if applicable
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local BCYAN="\[\033[1;36m\]"
  local YELLOW="\[\033[0;33m\]"
  local BLUE="\[\033[0;34m\]"
  local GRAY="\[\033[0;37m\]"
  local DKGRAY="\[\033[1;30m\]"
  local WHITE="\[\033[1;37m\]"
  local RED="\[\033[0;31m\]"
  # return color to Terminal setting for text color
  local DEFAULT="\[\033[0;39m\]"

  local STATUS_COLOR=$GREEN

  if [ $HAS_ERROR -eq 1 ]; then
    STATUS_COLOR=$YELLOW
  else
    STATUS_COLOR=$GREEN
  fi

	local HOSTNAME_SHORT="$(hostname -s)"
  local BRANCH="$(parse_git_branch)"
 
  #local TIME=`date +"%d.%m.%Y %H:%M:%S"`
  local TIME=`date +"%H:%M:%S"`
  local CURENT_PATH=`echo ${PWD/#$HOME/\~}`

  # trim long path
  if [ ${#CURENT_PATH} -gt "35" ]; then
    let CUT=${#CURENT_PATH}-35
    CURENT_PATH="...$(echo -n $PWD | sed -e "s/\(^.\{$CUT\}\)\(.*\)/\2/")"
  fi

  local TITLEBAR="\[\e]2;${CURENT_PATH}\a"

  local VENV=''
  # Display python virtualenv
  if [[ $VIRTUAL_ENV != "" ]]
    then
    VENV=" ${RED}(${VIRTUAL_ENV##*/})"
  fi

  # different prompt and color for root
  local PR="$ "
  local USERNAME_COLORED="${WHITE}${USER} @ ${WHITE}${HOSTNAME_SHORT}"
  if [ "$UID" = "0" ]; then
    echo "I am root"
    PR="# " 
    USERNAME_COLORED="${RED}${USER}${GREEN}@${RED}${HOSTNAME_SHORT}"
  fi

  # use only ASCII symbols in linux console
  local DASH="-"
  local TC=" ╔"
  local BC="═╩"
  if [ "$TERM" = "linux" ]; then
    TITLEBAR=""
    DASH="-"
    TC=""
    BC=""
  fi

  local TOP_LINE="${STATUS_COLOR}${TC}${CYAN}[ ${USERNAME_COLORED} ${GREEN}]${DASH}${GREEN}[ ${WHITE}${TIME}${GREEN} ]${DASH}${GREEN}[ ${GRAY}${CURENT_PATH} ${GREEN}] ${RED}${VENV} ${GREEN}${BRANCH} ${YELLOW}$ERRPROMPT"
  local BOTTOM_LINE="${STATUS_COLOR}${BC}${CYAN}[ ${GREEN}${PR}${DEFAULT}"
  export PS1="${TOP_LINE}\n${BOTTOM_LINE}"
}
PROMPT_COMMAND=promptCommand
