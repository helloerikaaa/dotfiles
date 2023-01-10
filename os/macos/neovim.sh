#!/bin/bash

if [[ `uname` == "Darwin" ]]; then
    echo "MacOS detected"

    echo "Removing existing dotfiles"
    rm -rf ~/.zshrc

    echo "Installing neovim"
    brew install neovim

    echo "Installing astrovim"
    git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
fi