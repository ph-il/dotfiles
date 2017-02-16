#!/bin/bash

### XCode Command Line Tools
./.xcode

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# Creation Projects directory
if ! [ -d "${HOME}/Projects" ] 
then
    mkdir -pv Projects
fi;

sudo apachectl stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

# Install everything in Brewfile
./.brew

# Install dotfiles
./bootstrap.sh

# Install somes applications with npm
./.npminstall

# Autoconfig somes application install with brew
./.appconfig

# Install Kuzzle
./.kuzzle

# Install Exakat
./.exakat

# Setup computer
./.macos
