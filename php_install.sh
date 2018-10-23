#brew install php@5.6
#pecl channel-update pecl.php.net
#pecl install apcu-4.0.11
#pecl install yaml-1.3.1
#pecl install xdebug-2.5.5
#pecl install redis
#pecl install memcached
#pecl install igbinary
#pecl install mcrypt
#pecl install intl
#pecl install geoip
#pecl install ast
#pecl install tidy


#brew install php@7.0
#pecl uninstall -r apcu
#pecl channel-update pecl.php.net
#pecl install apcu
#pecl uninstall -r xdebug
#pecl install xdebug
#pecl install redis
#pecl install memcached
#pecl install igbinary
#pecl install mcrypt
#pecl install intl
#pecl install geoip
#pecl install ast
#pecl install tidy
#pecl uninstall -r yaml
#pecl install yaml

#brew install php@7.1
#brew install blackfire-php71
#pecl channel-update pecl.php.net
#pecl uninstall -r apcu
#pecl install apcu
#pecl uninstall -r xdebug
#pecl install xdebug
#pecl install redis
#pecl install memcached
#pecl install igbinary
#pecl install mcrypt
#pecl install intl
#pecl install geoip
#pecl install ast
#pecl uninstall -r yaml
#pecl install yaml

brew install php@7.2
brew install blackfire-php72
pecl channel-update pecl.php.net
#pecl uninstall -r igbinary
pecl install igbinary
#pecl uninstall -r apcu
pecl install apcu
#pecl uninstall -r xdebug
pecl install xdebug
#pecl uninstall -r redis
pecl install redis
#pecl uninstall -r memcached
pecl install memcached
#pecl uninstall -r imagick
pecl install imagick
#pecl uninstall -r intl
pecl install intl
#pecl uninstall -r geoip
pecl install geoip
#pecl uninstall -r ast
pecl install ast
#pecl uninstall -r yaml
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