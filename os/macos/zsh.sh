#!/bin/bash

if [[ `uname` == "Darwin" ]]; then
    echo "MacOS detected"

    echo "Removing existing dotfiles"
    rm -rf "$HOME/.zshrc"

    echo "Isntalling Oh my ZSH!"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Installing zInit"
    sh -c "$(curl -fsSL https://git.io/zinit-install)"

    echo "Installing ZSH packages"
    brew install zsh-completions zsh-autosuggestions

    echo "Creating symlinks"
    touch "$HOME/.zshrc"
    ln -s "$HOME/repos/dotfiles/templates/zshrc" "$HOME/.zshrc"

    echo "Installing ZSH pure theme"
    mkdir -p "$HOME/.zsh"
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

    echo "Applying changes"
    source "$HOME/.zsh"
fi