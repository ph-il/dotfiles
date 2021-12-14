#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v
echo

brew install php@8.1
brew install blackfire-php81
sudo pecl channel-update pecl.php.net
sudo pecl install igbinary
sudo pecl install apcu
sudo pecl install xdebug
sudo pecl install redis
sudo pecl install memcached
sudo pecl install ast
sudo pecl install yaml

brew unlink php@8.1
brew install php@8.0
brew install blackfire-php80
brew link php@8.0
sudo pecl channel-update pecl.php.net
sudo pecl install igbinary
sudo pecl install apcu
sudo pecl install xdebug
sudo pecl install redis
sudo pecl install memcached
sudo pecl install ast
sudo pecl install yaml

# Configure PHP
sudo chmod -R guo+rw /opt/homebrew/etc/php/8.0/conf.d
cp ~/Projects/dotfiles/php/8.0/conf.d/*.ini /opt/homebrew/etc/php/8.0/conf.d/
