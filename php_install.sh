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

brew install php@7.1
brew install blackfire-php71
pecl channel-update pecl.php.net
pecl uninstall -r apcu
pecl install apcu
pecl uninstall -r xdebug
pecl install xdebug
pecl install redis
pecl install memcached
pecl install igbinary
pecl install mcrypt
pecl install intl
pecl install geoip
pecl install ast
pecl uninstall -r yaml
pecl install yaml

brew install php@7.2
brew install blackfire-php72
pecl channel-update pecl.php.net
pecl uninstall -r igbinary
pecl install igbinary
pecl uninstall -r apcu
pecl install apcu
pecl uninstall -r xdebug
pecl install xdebug
pecl uninstall -r redis
pecl install redis
pecl uninstall -r memcached
pecl install memcached
pecl uninstall -r imagick
pecl install imagick
pecl uninstall -r intl
pecl install intl
pecl uninstall -r geoip
pecl install geoip
pecl uninstall -r ast
pecl install ast
pecl uninstall -r yaml
pecl install yaml

brew bundle -v --file=Phpfile

brew cleanup -s