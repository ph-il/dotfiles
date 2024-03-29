#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v
echo

brew bundle -v --file=~/Projects/dotfiles/setup/Phpfile
brew install symfony-cli/tap/symfony-cli

brew cleanup -s

composer global require pdepend/pdepend
composer global require maglnet/composer-require-checker
composer global require icanhazstring/composer-unused

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

wget -O deployer.phar https://deployer.org/deployer.phar
chmod +x deployer.phar
sudo mv deployer.phar /usr/local/bin/dep

curl -L https://raw.githubusercontent.com/w00fz/xdebug-osx/master/xdebug-toggle > /usr/local/bin/xdebug-toggle

# Configure Blackfire
open "https://blackfire.io/docs/up-and-running/installation?action=install&mode=full&location=local&os=darwin&language=php&agent=&version=latest"

blackfire agent:config
