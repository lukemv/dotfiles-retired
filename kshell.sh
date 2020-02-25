files=( bashrc tmux.conf vimrc vim gitconfig bashrc.d scripts )
for file in ${files[@]}; do
	ln -sfn "$(pwd)/${file}" "$HOME/.${file}" && echo "simlink created .$file"
done
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

