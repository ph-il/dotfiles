brew install php@8.0
brew link php@8.0
brew install blackfire-php80
sudo pecl channel-update pecl.php.net
sudo pecl install igbinary
sudo pecl install apcu
sudo pecl install xdebug
sudo pecl install redis
sudo pecl install memcached
sudo pecl install ast
sudo pecl install yaml

brew bundle -v --file=Phpfile

brew cleanup -s

wget -O pdepend.phar http://static.pdepend.org/php/latest/pdepend.phar
chmod +x pdepend.phar
mv -f pdepend.phar /usr/local/bin/pdepend

wget -O phing.phar https://www.phing.info/get/phing-latest.phar
chmod +x phing.phar
mv -f phing.phar /usr/local/bin/phing

wget -O phpcpd.phar https://phar.phpunit.de/phpcpd.phar
chmod +x phpcpd.phar
mv -f phpcpd.phar /usr/local/bin/phpcpd

wget -O phpdox.phar http://phpdox.de/releases/phpdox.phar
chmod +x phpdox.phar
mv phpdox.phar /usr/local/bin/phpdox

wget -O phploc.phar https://phar.phpunit.de/phploc.phar 
chmod +x phploc.phar 
mv phploc.phar /usr/local/bin/phploc 

wget -O phpmd.phar -c http://static.phpmd.org/php/latest/phpmd.phar
chmod +x phpmd.phar 
mv phpmd.phar /usr/local/bin/phpmd 

wget -O phpunit-skelgen.phar https://phar.phpunit.de/phpunit-skelgen.phar
chmod +x phpunit-skelgen.phar
mv phpunit-skelgen.phar /usr/local/bin/phpunit-skelgen
