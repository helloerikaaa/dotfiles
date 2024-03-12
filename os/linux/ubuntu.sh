#!/bin/bash

if [[ $(uname) == "Linux" && -e /etc/lsb-release ]]; then
    echo "Ubuntu detected"

    echo "Updating and Upgrading Ubuntu packages"
    sudo apt-get update
    sudo apt-get upgrade -y

    echo "Installing necessary packages"
    sudo apt install git curl vim build-essential gcc-9 g++-9 -y

    echo "Installing ZSH and Oh My ZSH"
    sudo apt install zsh -y
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Installing Zinit"
    sh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

    echo "Installing ZSH plugins"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    echo "Sourcing ZSHRC"
    source ~/.zshrc

    echo "Configuration of CUDA (GeForce 4070)"
    sudo apt install ubuntu-drivers-common
    sudo apt install nvidia-driver-525
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
    sudo dpkg -i cuda-keyring_1.1-1_all.deb
    sudo apt-get update
    sudo apt-get -y install cuda-toolkit-12-3
    echo "PATH=/usr/local/cuda/bin${PATH:+:${PATH}}" >> ~/.zshrc
    echo "LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.zshrc
    source ~/.zshrc

    echo "Configuring global GitHub user"
    GIT_USER=$(gum input --prompt "Enter your github username: ")
    GIT_EMAIL=$(gum input --prompt "Enter your github email: ")
    git config --global user.name $GIT_USER
    git config --global user.email $GIT_EMAIL

    echo "Creating SSH key for GitHub repositories"
    ID_NAME=$(gum input --prompt "Enter name for the ssh key: ")
    ssh-keygen -t rsa $ID_NAME

    echo "Configuring SSH key for the Github host"
    touch "$HOME/.ssh/config"
    echo "Host github.com" >> "$HOME/.ssh/config"
    echo "HostName github.com" >> "$HOME/.ssh/config"
    echo "IdentityFile $HOME/.ssh/$ID_NAME" >> "$HOME/.ssh/config"

    echo "Installing NeoVim"
    sudo apt install libfuse2
    sh -c "$(curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage)"
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/nvim

    echo "Installing astrovim"
    git clone https://github.com/AstroNvim/AstroNvim "$HOME/.config/nvim"
else
    echo "Ubuntu not detected. Please select another OS"
fi