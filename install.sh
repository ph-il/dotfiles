#!/bin/bash

### XCode Command Line Tools
source .xcode

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# Creation Projects directory
if ! [ -d "${HOME}/Projects" ] 
then
    mkdir -pv Projects
fi;

# Install everything in Brewfile
source .brew

# Install dotfiles
./bootstrap.sh

# Install somes applications with npm
source .npminstall

# Autoconfig somes application install with brew
source .appconfig

# Install Kuzzle
source .kuzzle

# Install Exakat
#source .exakat

# Setup computer
source .macos
