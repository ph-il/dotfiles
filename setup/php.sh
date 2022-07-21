#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v
echo

eval "$(/opt/homebrew/bin/brew shellenv)"

brew install php@8.1
brew install blackfire-php81
PHP_VERSION="`php -r \"error_reporting(0); echo phpversion();\"`"
ln -s /opt/homebrew/Cellar/pcre2/10.40/include/pcre2.h /opt/homebrew/Cellar/php/$PHP_VERSION/include/php/ext/pcre/pcre2.h
sudo pecl channel-update pecl.php.net
sudo pecl install igbinary
sudo pecl install msgpack
yes no | sudo pecl install apcu
sudo pecl install imagick
sudo pecl install xdebug
yes | sudo pecl install redis
yes no | sudo PHP_ZLIB_DIR=$(brew --prefix zlib) pecl install memcached
sudo pecl install ast
sudo PHP_YAML_DIR=$(brew --prefix libyaml) pecl install yaml

#brew unlink php@8.1

#brew install php@8.0
#brew link php@8.0
#PHP_VERSION="`php -r \"error_reporting(0); echo phpversion();\"`"
#ln -s /opt/homebrew/Cellar/pcre2/10.39/include/pcre2.h /opt/homebrew/Cellar/php@8.0/$PHP_VERSION/include/php/ext/pcre/pcre2.h
#brew install blackfire-php80
#sudo pecl channel-update pecl.php.net
#sudo pecl install igbinary
#sudo pecl install msgpack
#yes no | sudo pecl install apcu
#sudo pecl install imagick
#sudo pecl install xdebug
#yes | sudo pecl install redis
#yes no | sudo PHP_ZLIB_DIR=$(brew --prefix zlib) pecl install memcached
#sudo pecl install ast
#sudo PHP_YAML_DIR=$(brew --prefix libyaml) pecl install yaml

brew install blackfire

# Configure PHP
#sed -i '' '/extension=/d' /opt/homebrew/etc/php/8.0/php.ini
sed -i '' '/extension=/d' /opt/homebrew/etc/php/8.1/php.ini

#sudo chmod -R guo+rw /opt/homebrew/etc/php/8.0/conf.d
#cp ~/Projects/dotfiles/php/8.0/conf.d/*.ini /opt/homebrew/etc/php/8.0/conf.d/

sudo chmod -R guo+rw /opt/homebrew/etc/php/8.1/conf.d
cp ~/Projects/dotfiles/php/8.1/conf.d/*.ini /opt/homebrew/etc/php/8.1/conf.d/
