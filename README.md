## Dotfiles and workstation configuration

On a new workstation I typically do the following as a minimal setup:

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install ansible
$ git clone {This Repo}
$ cd {This Repo}
$ ansible-playbook -i inventory playbook.yml 
```

For daily aliases and environment variables use `~/.bash_aliases` which is sourced within `~/.bash_profile` 

The following tweaks also get done on all of my workstations:

Allow press and hold in Visual Studio Code.

```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

Speed up keyrepeat

```
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

