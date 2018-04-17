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

brew unlink php${PHP_VERSION}
brew unlink php${PHP_VERSION}-apcu

brew link php56
brew link php56-apcu
brew bundle -v --file=Php56file
brew bundle -v --file=Phpfile
brew unlink php56-apcu
brew unlink php56

brew link php70
brew link php70-apcu
brew bundle -v --file=Php70file
brew unlink php70-apcu
brew unlink php70

brew link php71
brew link php71-apcu
brew bundle -v --file=Php71file
brew bundle -v --file=Phpfile
brew unlink php71-apcu
brew unlink php71

brew link php72
brew link php72-apcu
brew bundle -v --file=Php72file
brew bundle -v --file=Phpfile
brew unlink php72-apcu
brew unlink php72

brew link php${PHP_VERSION}
brew link php${PHP_VERSION}-apcu

brew bundle -v --file=Caskfile
brew bundle -v --file=Gemfile
brew bundle -v --file=Masfile

#brew unlink php${PHP_VERSION}

./bootstrap.sh
