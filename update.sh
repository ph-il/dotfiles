#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

#
# Update all the things with Homebrew, Casks and a Brewfile
#

update

brew tap Homebrew/bundle

brew bundle -v --file=Tapfile

brew update
brew upgrade

brew bundle -v 

brew bundle -v --file=Caskfile
brew bundle -v --file=Masfile

#brew unlink php${PHP_VERSION}

./bootstrap.sh
