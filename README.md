## Dotfiles and workstation configuration

**tmux splits navigation**

The tmux splits have the following key bindings

* CTRL+↑ - Go to split above
* CTRL+↓ - Go to split below 
* CTRL+← - Go to split left
* CTRL+→ - Go to split right

On MacOS these keys are bound to Mission Control stuff, these can be unbound by doing in to preferences -> Keyboard -> Shortcuts.


**Other random tweaks**
Allow press and hold in Visual Studio Code.

```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

Speed up keyrepeat

```
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```


Install Adobe Source Code Pro

```
brew tap caskroom/fonts && brew cask install font-source-code-pro
```

The iterm2 folder is just a rough example of what I'm currently running
