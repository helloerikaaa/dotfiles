if [[ `uname` == "Darwin"   ]]; then
    echo "Mac detected. Using Mac config..."
    echo "Accepting xcodebuild licence"
    xcodebuild -license accept -y

    defaults write -g ApplePressAndHoldEnabled -bool false

    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    $(brew --prefix)/opt/fzf/install

    echo "Installing Oh my ZSH"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Installing zInit"
    sh -c "$(curl -fsSL https://git.io/zinit-install)"

    echo "Installing ZSH packages"
    brew install zsh-completions zsh-autosuggestions 

    echo "Removing existing dotfiles"
    rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.config/nvim

    echo "Creating symlinks"
    ln -s ~/repos/dotfiles/zshrc ~/.zshrc

    echo "Installing pyenv"
    brew install pyenv

    echo "Installing python 3"
    pyenv install 3.8.6
    pyenv global 3.8.6

    echo "Installing neovim"
    brew install neovim

    echo "Installing astrovim"
    git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

    echo "Installing the fuck"
    brew install thefuck

    echo "Installing casks"
    brew tap homebrew/cask-fonts
    brew install --cask visual-studio-code warp font-fira-code
fi

mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
alias vim="nvim"