#!/bin/bash
############################
# This script symlinks config dirs in the home directory to any desired dotfiles in ~/dotfiles
############################

# NOTE: After this script has run, to install all of the vim plugins
# simply open vim and type :PluginInstall.. Vundle will do it's thing and
# iterate though all of the listed Plugin and Bam!.. it's already there... Apple..

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim"    

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
    # Move existing file to the backup directory
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    # Create a symlink that points to the dotfiles file.
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done

# Create the bundle directory
mkdir ~/.vim/bundle

# Clone Vundle into it
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
