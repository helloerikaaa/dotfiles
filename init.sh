if [[ `uname` == "Darwin"   ]]; then
    echo "Mac detected. Using Mac config..."

    echo "Installing Oh my zsh!"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Installing Brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    echo "Installing packages with brew"
    brew install thefuck
    
    brew tap homebrew/cask-fonts
    brew tap wez/wezterm

    brew install --cask font-fira-code
    brew install --cask spotify
    brew install --cask visual-studio-code
    brew install --cask lastpass
    brew install --cask hyper
    brew install --cask docker

    echo "Installing PyEnv"
    brew install pyenv

    echo "Installing Python 3"
    pyenv install 3.9.2
    pyenv global 3.9.2

    echo "Installing Pipenv"
    pip install pipenv

    echo "Symlinking Files"
    ln -s ~/dotfiles/zshrc ~/.zshrc
    ln -s ~/dotfiles/git ~/.gitconfig
    ln -s ~/dotfiles/hyperjs ~/.hyper.js