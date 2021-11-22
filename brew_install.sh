#!/bin/bash

# If Homebrew is not installed
if ! which brew > /dev/null; then
     # Install Homebrew 
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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
