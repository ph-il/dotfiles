#!/bin/bash
#
# Install all the things with Homebrew, Casks and a Brewfile
#

cd

mkdir -pv Projects

# If Homebrew is not installed
if ! which brew > /dev/null; then
     # Install Homebrew 
     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

brew tap Homebrew/bundle
brew bundle ./Brewfile/Tapsfile

# Update brew
brew upgrade
brew update

# Install everything in Brewfile

brew bundle ./Brewfile/Brewfile
brew bundle ./Brewfile/Php55file
brew unlink php55
brew bundle ./Brewfile/Php56file
brew unlink php56
brew bundle ./Brewfile/Php70file
brew unlink php70
brew bundle ./Brewfile/Php71file
brew bundle ./Brewfile/Gemfile
brew bundle ./Brewfile/Caskfile
brew bundle ./Brewfile/Fontfile

sudo npm install -g bower
sudo npm install -g less

# Configure Blackfire
sudo blackfire-agent -register
ln -sfv /usr/local/opt/blackfire-agent/*.plist ~/Library/LaunchAgents

## Configure MySQL
mysql_secure_installation
sudo mkdir /var/mysql
sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock

# Setup computer
./.macos



