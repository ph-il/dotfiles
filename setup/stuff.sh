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

brew doctor
brew cleanup

brew tap Homebrew/bundle

brew bundle -v --file=~/Projects/dotfiles/setup/Tapfile

brew update
brew upgrade

# Install everything in Brewfile
brew bundle -v --file=~/Projects/dotfiles/setup/Brewfile

brew install homebrew-ffmpeg/ffmpeg/ffmpeg $(brew options homebrew-ffmpeg/ffmpeg/ffmpeg | grep -vE '\s' | grep -- '--with-' | grep -vi chromaprint |grep -vi decklink | tr '\n' ' ')

# git-friendly
curl -sS https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh | bash

# Extend global $PATH
echo -e "setenv PATH $HOME/Projects/dotfiles/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" | sudo tee /etc/launchd.conf

brew cleanup -s

