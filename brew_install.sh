#!/bin/bash

# If Homebrew is not installed
if ! which brew > /dev/null; then
     # Install Homebrew 
     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# Install everything in Brewfile

brew doctor
brew prune

brew tap Homebrew/bundle

brew bundle -v --file=Tapfile

brew update
brew upgrade

brew bundle -v 

brew install php56 --with-httpd24
brew bundle -v --file=Php56file
brew unlink php56
brew unlink php56-apcu

brew install php70 --with-httpd24
brew bundle -v --file=Php70file
brew unlink php70
brew unlink php70-apcu

brew install php71 --with-httpd24
brew bundle -v --file=Php71file
brew unlink php71
brew unlink php71-apcu

brew install php72 --with-httpd24
brew bundle -v --file=Php72file

brew bundle -v --file=Phpfile

brew bundle -v --file=Caskfile
brew bundle -v --file=Gemfile
brew bundle -v --file=Masfile
