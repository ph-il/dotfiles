#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
    rsync --exclude ".git/" \
        --exclude ".gitconfig" \
        --exclude ".DS_Store" \
        --exclude "macos.sh" \
        --exclude "exakat_install.sh" \
        --exclude "brew_install.sh" \
	    --exclude "php_install.sh" \
        --exclude "npm_install.sh" \
        --exclude "app_config.sh" \
        --exclude "install.sh" \
        --exclude "update.sh" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        --exclude "Apache/" \
	    --exclude "php/" \
        --exclude "Brewfile" \
        --exclude "Tapfile" \
        --exclude "Caskfile" \
        --exclude "Fontfile" \
        --exclude "Gemfile" \
        --exclude "Masfile" \
        --exclude "Phpfile" \
		--exclude "Tapfile.lock.json" \
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