ask() {
    # https://gist.github.com/davejamesmiller/1965569
    local prompt default reply

    if [ "${2:-}" = "Y" ]; then
        prompt="Y/n"
        default=Y
    elif [ "${2:-}" = "N" ]; then
        prompt="y/N"
        default=N
    else
        prompt="y/n"
        default=
    fi

    while true; do

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read reply </dev/tty

        # Default?
        if [ -z "$reply" ]; then
            reply=$default
        fi

        # Check if the reply is valid
        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

sentence="would you like to create a file link for"
files=( bashrc bash_profile tmux.conf vimrc vim gitconfig bashrc.d scripts )
for file in ${files[@]}; do
	ask "(dotfile) $sentence .$file?" && ln -sfn "$(pwd)/${file}" "$HOME/.${file}" && echo "simlink created .$file"
done

files=( keybindings.json settings.json )
for file in ${files[@]}; do
    target="${HOME}/Library/Application Support/Code/User/${file}"
	ask "(vscode) $sentence $file?" && ln -sfn "$(pwd)/vscode/${file}" "$target" && echo "simlink created $target"
done


ask "would you like to install Vundle?" && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


ask "(dotfile) would you like to link .config/nvim?" && ln -sfn "$(pwd)/nvim" "$HOME/.config/nvim" && echo "simlink created nvim"
