#!/bin/bash

if [[ `uname` == "Darwin" ]]; then
    echo "MacOS detected"

    echo "Accepting XCode License"
    xcodebuild -license accept -y
    defaults write -g AppplePressAndHoldEnabled -bool false

    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    $(brew --prefix)/opt/fzf/install

    echo "Installing Pyenv"
    brew install pyenv

    PYVER=$(gum input --prompt "Which python version would you like to install: ")
    echo "Installing python $PYVER"
    pyenv install $PYVER
    pyenv global $PYVER

    echo "Installing Git"
    brew install git

    echo "Configuring global user"
    GIT_USER=$(gum input --prompt "Enter your github username: ")
    GIT_EMAIL=$(gum input --prompt "Enter your github email: ")
    git config --global user.name $GIT_USER
    git config --global user.email $GIT_EMAIL

    echo "Creating SSH key for Github repositories"
    ID_NAME=$(gum input --prompt "Enter name for the ssh key: ")
    ssh-keygen -t rsa $ID_NAME

    echo "Configuring SSH key for the Github host"
    touch "$HOME/.ssh/config"
    echo "Host github.com" >> "$HOME/.ssh/config"
    echo "UseKeychain yes" >> "$HOME/.ssh/config"
    echo "AddKeysToAgent yes" >> "$HOME/.ssh/config"
    echo "HostName github.com" >> "$HOME/.ssh/config"
    echo "IdentityFile $HOME/.ssh/$ID_NAME" >> "$HOME/.ssh/config"

    echo "Installing the fuck"
    brew install thefuck

    echo "Installing casks"
    brew tap homebrew/cask-fonts
    brew install --cask visual-studio-code warp font-fira-code

else
    echo "MacOS not detected. Please select another OS"
fi
