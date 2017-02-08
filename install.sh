#!/bin/bash
#
# Install all the things with Homebrew, Casks and a Brewfile
#

# If Homebrew is not installed
if ! which brew > /dev/null; then
     # Install Homebrew 
     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# Update brew
brew upgrade
brew update

brew tap Homebrew/bundle
# Install everything in Brewfile
brew bundle

# Setup computer

chflags nohidden ~/Library
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true