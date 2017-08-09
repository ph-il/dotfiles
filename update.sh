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

#brew unlink php${PHP_VERSION}

#brew link php55
#brew bundle -v --file=Php55file
#brew unlink php55

#brew link php56
#brew bundle -v --file=Php56file
#brew unlink php56

#brew link php70
#brew bundle -v --file=Php70file
#brew unlink php70
#brew unlink php70-apcu

#brew link php71
brew bundle -v --file=Php71file
brew bundle -v --file=Phpfile
#brew unlink php71

#brew link php${PHP_VERSION}

brew bundle -v --file=Caskfile
brew bundle -v --file=Gemfile
brew bundle -v --file=Masfile

#brew unlink php${PHP_VERSION}

./bootstrap.sh
