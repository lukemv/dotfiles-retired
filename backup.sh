#!/bin/bash
cp ~/.vimrc ~/dotfiles/.vimrc
cp ~/.bashrc ~/dotfiles/.bashrc

echo "# List of plugins in bundle directory" >> ~/dotfiles/.vimrc
for line in $(ls ~/.vim/bundle); do echo "# $line" >> ~/dotfiles/.vimrc; done; 
