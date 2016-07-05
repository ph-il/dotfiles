# phposxinstall
My Installation of PHP and Tools for OSX

## Install textmate 2

* Download Textmate 2 at : http://api.textmate.org/downloads/beta 
* Install it in your app directory
* Run Textmate to install the CLI version
	* It will be in the menu : TextMate | Preferences | Terminal 
	* Click install

## Determine a "Projects" directory

You'll need to determine a directory for all projects.
I recommend ~/projects, so it's the one I'll use on all examples. Please fell free to change it.
     
* Execute
```sh
cd
mkdir -pv projects
```

## Install Alias and Configuration for the Command Line.

* Check with `ls ~/.profile`, if you have a .profile file
* If you have one, rename it (i.e. profile.txt ), then you’ll be able to your .bashrc file. We use .bashrc for your own configuration, and .profile for this install and any updates of installation and alias.
* Copy .profile in your home directory
```sh
cp profile.txt ~/.profile
```
	
* Execute
```sh
source ~/.profile
```

## Install Xcode

* Run the App Store
* Find and Choose Download on Xcode
* Once the installation finishes, start Xcode to complete the installation.

## Install Homebrew

* Execute
      
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/php
brew tap blackfireio/homebrew-blackfire
brew update
brew upgrade
```
	
Please correct the problems brew doctor will give you. It might be different for every body.

## Install tools, git & newer version of autoconf

* Execute
```sh
brew install autoconf git ack wget curl redis memcached libmemcached colordiff imagemagick icoutils gettext icu4c libxml2 unixodbc readline bash-git-prompt blackfire-agent highlight
```

## Install Redis

As redis is more an more usefull and will be used in some of our tools, it's already installed. But : 

* To have launchd start redis now and restart at login:
```sh
brew services start redis
```

* Or, if you don't want/need a background service you can just run:
```sh
redisstart
```
## Install Blackfire 

* Configure your Blackfire credentials:
```sh
sudo blackfire-agent -register
```

* Register the blackfire-agent service:
```sh
ln -sfv /usr/local/opt/blackfire-agent/*.plist ~/Library/LaunchAgents
```

* Then load it for the first time:
```sh
bfstart
```

* In order to restart the service, and whenever you modify its configuration, unload it:
```sh
bfstop
```

* Then load it again:
```sh
bfstart
```

## Install Memcached

As memcached is  usefull and will be used in some of our tools, it's already installed. But : 

* To restart memcached after an upgrade:
```sh
brew services restart memcached
```

* Or, if you don't want/need a background service you can just run:
```sh
memstart
```

## Install MySQL

* Execute
```ql
brew install mysql
mysql_secure_installation
sudo mkdir /var/mysql
sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock
```

* To restart MySql after an upgrade:
```sh
brew services restart mysql
```

* Or, if you don't want/need a background service you can just run:
```sh
mysqlstart
```

* To connect run:
```sh
mysql -uroot
```

## Install PHP 5.5

We install different versions of PHP so we can switch between them for development and help to run every test in Exakat.

* Execute
```sh
brew install php55
```

### Install Extensions

* Execute
```sh
brew install php55-igbinary php55-memcached php55-memcache php55-opcache php55-mcrypt php55-apcu php55-intl php55-xdebug php55-twig php55-mongo php55-oauth php55-solr php55-tidy php55-xhprof blackfire-php55 php55-redis php55-yaml
```

### Test PHP 5.5

* Execute
```sh
$(brew --prefix homebrew/php/php55)/bin/php -i "(command-line 'phpinfo()')"
```

* Make sure that everyting is working

### Unlink PHP 55

* Execute
```sh
brew unlink php55
```

## Install PHP 5.6

We install different versions of PHP so we can switch between them for development and help to run every test in Exakat.

* Execute
```sh
brew install php56
```

###Install Extensions

* Execute
```sh
brew install php56-igbinary php56-memcached php56-memcache php56-opcache php56-apcu php56-intl php56-mcrypt php56-xdebug php56-twig php56-mongo php56-oauth php56-solr php56-tidy php56-xhprof blackfire-php56 php56-redis php56-yaml
```

### Test PHP 5.6

* Execute
```sh
$(brew --prefix homebrew/php/php56)/bin/php -i "(command-line 'phpinfo()')"
```

* Make sure that everyting is working

### Unlink PHP 5.6

* Execute
```sh
brew unlink php56
```

## Install PHP 7.0

We install different versions of PHP so we can switch between them for development and help to run every test in Exakat.

* Execute
```sh
brew install php70
```
###Install Extensions

* Execute
```sh
brew install --HEAD homebrew/php/php70-igbinary --HEAD homebrew/php/php70-memcached --HEAD homebrew/php/php70-redis --HEAD homebrew/php/php70-yaml
brew install php70-opcache php70-apcu php70-intl php70-xdebug php70-mcrypt php70-mongodb php70-oauth php70-tidy blackfire-php70
```

### Test PHP 7.0

* Execute
```sh
php -i "(command-line 'phpinfo()')"
```

* Make sure that everyting is working


## Configure PHP

* Execute
```sh
cfgphp
```

* Update PHP Init files
```sh
date.timezone = America/Toronto
date.default_latitude  = 45.54545
date.default_longitude = -73.63908

error_reporting  =  E_ALL

display_errors = On

[xdebug]
xdebug.var_display_max_children = 999
xdebug.var_display_max_data = 999
xdebug.var_display_max_depth = 100

```

### Test PHP

* Execute
```sh
php -i "(command-line 'phpinfo()')"
```

* Make sure that everyting is working

## Run PostgreSql

* To have launchd start postgresql now and restart at login:

```sh
brew services start postgresql
```

* Or, if you don't want/need a background service you can just run:

```sh
pgstart
```

## Install Composer

* Execute
```sh
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

## Install Symfony Installer

* Execute
```sh
sudo curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony
```

## Install SASS and Compass

* Execute
```sh
sudo gem install compass
sudo gem install css_parser
sudo gem install breakpoint
```

## Setup Apache

* Execute
```sh
cfgapache
```

```sh
COMM='s/username/'$(whoami)'/g'
for i in /etc/apache2/other/*.conf ; do sudo sed -i '' $COMM "$i" ; done
```

* Edit the `/etc/apache2/httpd.conf` file
* Search for `#LoadModule php5_module`. 
	* You will notice that this is line is commented out. 
	* Remove it. 
* Below the other LoadModule lines, add this:

```sh
	# Brew PHP LoadModule for `sphp` switcher
	LoadModule php5_module /usr/local/lib/libphp5.so
	#LoadModule php7_module /usr/local/lib/libphp7.so
```

* Uncomment the `mod_rewrite.so` module definition

* Remplace `<Directory />` block in the file `httpd.conf` by:

```sh
	Options FollowSymLinks Multiviews Indexes
	<Directory />
	    Options FollowSymLinks Multiviews Indexes
	    AllowOverride All
	    Require all granted
	</Directory>
```

* Find `User _www`
* Remplace User and Group
```sh
User your_username
Group staff
```

* Search for this block:
```sh
<IfModule dir_module>
    DirectoryIndex index.html
</IfModule>
```
* Replace it with this:
```sh
<IfModule dir_module>
    DirectoryIndex index.php index.html
</IfModule>
```

* Find someting like:
```sh
<FilesMatch "^\.([Hh][Tt]|[Dd][Ss]_[Ss])">
    Require all denied
</FilesMatch>
```

* Below, paste the following:
```sh
<FilesMatch \.php$>
    SetHandler application/x-httpd-php
</FilesMatch>
```

* At the end be sure there is this line available : 

```sh
Include /private/etc/apache2/other/*.conf
```

* Create the vhost files for the projects you’ll work on. There’s example in this project.
* If you're using thos example. Replace every occurrence of "username" with your own login by executing


## Setup Hosts

* To update your .hosts file, execute:
```sh
cfghosts
```




