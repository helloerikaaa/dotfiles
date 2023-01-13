#!/bin/sh

gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'Welcome to the dotfiles utility.' 'Setup your MacOS and Raspberry Pi devices' 'Feedback: @helloerikaaa on github'

echo "Select the dependencies to install"
DEP=$(gum choose "All" "Neovim" "ZSH")

if [[ $DEP == "All" ]]; then
	sh ./os/macos/macos.sh
	sh ./os/macos/zsh.sh
	sh ./os/macos/neovim.sh
elif [[ $DEP == "Neovim" ]]; then
	sh ./os/macos/neovim.sh
elif [[ $DEP == "ZSH" ]]; then
	sh ./os/macos/zsh.sh
fi
