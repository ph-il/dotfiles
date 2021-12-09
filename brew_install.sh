#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v
echo

# If Homebrew is not installed
if ! which brew > /dev/null; then
     # Install Homebrew
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	 eval "$(/opt/homebrew/bin/brew shellenv)"
fi;

# Install everything in Brewfile

brew doctor
brew cleanup

brew tap Homebrew/bundle

brew bundle -v --file=Tapfile

brew update
brew upgrade

brew bundle -v
brew cleanup -s

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//')
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

## Configure MySQL
mysql_secure_installation
sudo mkdir /var/mysql
sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock

# Update global git config
git lfs install
# Update system git config
sudo git lfs install --system
