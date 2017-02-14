#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".macos" \
        --exclude "install.sh" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        --exclude "Apache" \
        --exclude "Brewfile" \
        --exclude "Tapfile" \
        --exclude "Caskfile" \
        --exclude "Fontfile" \
        --exclude "Gemfile" \
        --exclude "Masfile" \
        --exclude "Phpfile" \
        --exclude "Php55file" \
        --exclude "Php56file" \
        --exclude "Php70file" \
        --exclude "Php71file" \
        -avh --no-perms . ~;
    source ~/.profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;