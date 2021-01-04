brew tap exolnet/homebrew-deprecated

brew install php@5.6
pecl channel-update pecl.php.net
pecl install igbinary
pecl install apcu
pecl install xdebug
pecl install redis
pecl install memcached
pecl install intl
pecl install geoip
pecl install ast
pecl install yaml

brew unlink php@5.6

brew install php@7.2
pecl channel-update pecl.php.net
pecl install igbinary
pecl install apcu
pecl install xdebug
pecl install redis
pecl install memcached
pecl install intl
pecl install geoip
pecl install ast
pecl install yaml

brew unlink php@7.2

brew install php@7.3
pecl channel-update pecl.php.net
pecl install igbinary
pecl install apcu
pecl install xdebug
pecl install redis
pecl install memcached
pecl install intl
pecl install geoip
pecl install ast
pecl install yaml

brew unlink php@7.3

brew install php@7.4
brew install blackfire-php74
pecl channel-update pecl.php.net
pecl install igbinary
pecl install apcu
pecl install xdebug
pecl install redis
pecl install memcached
pecl install imagick
pecl install intl
pecl install geoip
pecl install ast
pecl install yaml

brew unlink php@7.4

brew install php
brew install blackfire-php80
pecl channel-update pecl.php.net
pecl install igbinary
pecl install apcu
pecl install xdebug
pecl install redis
pecl install memcached
pecl install imagick
pecl install intl
pecl install geoip
pecl install ast
pecl install yaml

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