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