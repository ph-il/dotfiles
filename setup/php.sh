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

brew bundle -v --file=~/Projects/dotfiles/setup/Phpfile

brew cleanup -s

composer global require pdepend/pdepend
composer global require phing/phing

wget -O phpcpd.phar https://phar.phpunit.de/phpcpd.phar
chmod +x phpcpd.phar
sudo mv -f phpcpd.phar /usr/local/bin/phpcpd

wget -O phpdox.phar https://phpdox.de/releases/phpdox.phar
chmod +x phpdox.phar
sudo mv phpdox.phar /usr/local/bin/phpdox

wget -O phploc.phar https://phar.phpunit.de/phploc.phar
chmod +x phploc.phar
sudo mv phploc.phar /usr/local/bin/phploc

wget -O phpmd.phar -c https://phpmd.org/static/latest/phpmd.phar
chmod +x phpmd.phar
sudo mv phpmd.phar /usr/local/bin/phpmd

wget -O phpunit-skelgen.phar https://phar.phpunit.de/phpunit-skelgen.phar
chmod +x phpunit-skelgen.phar
sudo mv phpunit-skelgen.phar /usr/local/bin/phpunit-skelgen

curl -L https://raw.githubusercontent.com/w00fz/xdebug-osx/master/xdebug-toggle > /usr/local/bin/xdebug-toggle

# Configure Blackfire
# sudo blackfire-agent -register
# ln -sfv /usr/local/opt/blackfire-agent/*.plist ~/Library/LaunchAgents
