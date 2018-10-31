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
  # set an error string for the prompt, if applicable
  if [ $? -eq 0 ]; then
    ERRPROMPT=" "
  else
    ERRPROMPT=" ($?) "
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

  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local BCYAN="\[\033[1;36m\]"
  local BLUE="\[\033[0;34m\]"
  local GRAY="\[\033[0;37m\]"
  local DKGRAY="\[\033[1;30m\]"
  local WHITE="\[\033[1;37m\]"
  local RED="\[\033[0;31m\]"
  # return color to Terminal setting for text color
  local DEFAULT="\[\033[0;39m\]"


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
    PR="# "
    USERNAME_COLORED="${RED}${USER}${GREEN}@${RED}${HOSTNAME_SHORT}"
  fi

  # use only ASCII symbols in linux console
  local DASH="\e(0q\e(B"
  local TC="\]\e(0l\e(B\]"
  local BC="\[\e(0\]m\[\e(B\]"
  if [ "$TERM" = "linux" ]; then
    TITLEBAR=""
    DASH="-"
    TC=""
    BC=""
  fi

  local TOP_LINE="${GREEN}${TC}${GREEN}[ ${USERNAME_COLORED} ${GREEN}]-${GREEN}[ ${WHITE}${TIME}${GREEN} ]-${GREEN}[ ${GRAY}${CURENT_PATH} ${GREEN}] ${RED}${VENV} ${GREEN}${BRANCH} ${RED}$ERRPROMPT"
  local BOTTOM_LINE="${GREEN}${BC}${CYAN}[ ${GREEN}${PR}${DEFAULT}"
  export PS1="${TOP_LINE}\n${BOTTOM_LINE}"
}
PROMPT_COMMAND=promptCommand
