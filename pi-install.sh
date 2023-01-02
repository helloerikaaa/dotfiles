echo "Creating .ssh folder and files"
mkdir ~/.ssh
ssh-keygen
touch ~/.ssh/config

echo "Installing CMake..."
sudo apt install -y cmake

echo "Updating Raspberry Pi..."
sudo apt update
sudo apt upgrade -y

echo "Installing dependencies..."
sudo apt install -y build-essential openssl tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev

echo "Installing pyenv"
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

echo "Installing Python 3.8.6"
pyenv install 3.8.6
pyenv global 3.8.6
