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

    echo "Installing the fuck"
    brew install the fuck

    echo "Installing casks"
    brew tap homebrew/cask-fonts
    brew install --cask visual-studio-code warp font-fira-code

else
    echo "MacOS not detected. Please select another OS"
fi
