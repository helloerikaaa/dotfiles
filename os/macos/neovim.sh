#!/bin/bash

if [[ `uname` == "Darwin" ]]; then
    echo "MacOS detected"

    echo "Removing existing dotfiles"
    rm -rf "$HOME/.config/nvim"

    echo "Installing neovim"
    brew install neovim

    echo "Installing astrovim"
    git clone https://github.com/AstroNvim/AstroNvim "$HOME/.config/nvim"
fi