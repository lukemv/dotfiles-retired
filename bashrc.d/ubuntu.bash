if [ -d "/etc/os-release" ]
then
  os=`awk -F= '/^NAME/{print $2}' /etc/os-release`

  if [ "$os" == "\"Ubuntu\"" ]
  then
    echo "adding ubuntu customizations"
    xset r rate 225 100
  fi
fi
