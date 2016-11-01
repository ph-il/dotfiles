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
* Execute
```sh
xcode-select --install
```

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
brew install autoconf git ack wget curl redis memcached libmemcached colordiff imagemagick icoutils gettext icu4c libxml2 unixodbc readline bash-git-prompt blackfire-agent highlight maven node rbenv ruby-build sqlite3 gpg
```

## Install Ruby
```sh
rbenv install 2.3.1
rbenv global 2.3.1
ruby -v
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
```sh
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
brew install php70-opcache php70-apcu php70-intl php70-xdebug php70-mcrypt php70-mongodb php70-oauth php70-tidy blackfire-php70 php70-ast
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
## Install Bower

* Execute
```sh
sudo npm install -g bower
```
## Install Bundler

* Execute
```sh
sudo gem install bundler
```
## Install Less, SASS and Compass

* Execute
```sh
sudo npm install -g less
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

## Install PHP Coding Standards Fixer, PHP_CodeSniffer, PHPUnit, Composer, Symfony Installer, ...

* Execute:
```sh
brew install php-cs-fixer pdepend php-code-sniffer phpunit phpunit-skeleton-generator phpmd phpmetrics phploc phpcpd composer symfony-installer phan
```

## Update Tools 

* Execute:
```sh
toolsupdate
```

This will updates all tools.

## Install Exakat

* Create the directory for Exakat by executing 
```sh
    goprj
    mkd tools/exakat
```

### Install Java

Install Java(TM) JDK 1.8. Neo4j recommends using Java 1.7, but is currently reported to work correctly with Java 1.8. Some variable are already set in our `.profile` file.

* Go to [Java Se Download](http://www.oracle.com/technetwork/java/javase/downloads/index.html) and follow the instructions
* Check with `java -version`
* `echo $JAVA_HOME` (Should be set to the path of Java 1.8)

### Install Neo4j

We need Neo4j 2.3.\* (tested with 2.3.5)

* Execute: 
```sh
    goexakat
    curl -O http://neo4j.com/artifact.php?name=neo4j-community-2.3.5-unix.tar.gz 
    tar -xf artifact.php\?name=neo4j-community-2.3.5-unix.tar.gz
    mv neo4j-community-2.3.5 neo4j
    rm artifact.php\?name=neo4j-community-2.3.5-unix.tar.gz
    neostart
    neostop
    mate $NEO4J_HOME/conf/neo4j-server.properties
```    

* Register the Gremlin plugin in the `$NEO4J_HOME/conf/neo4j-server.properties` file. To do so, add this line:

```
    org.neo4j.server.thirdparty_jaxrs_classes=com.thinkaurelius.neo4j.plugins=/tp
```

#### Gremlin plug-in

This install [gremlin plug-in](https://github.com/thinkaurelius/neo4j-gremlin-plugin) for Neo4j.
  
* First, in command line : 

```sh
    git clone https://github.com/thinkaurelius/neo4j-gremlin-plugin.git gremlin-plugin
    cd gremlin-plugin
    mate pom.xml
```

* Make the following changes in the following files : 

    1 `pom.xml` : change the version tag from 2.3.1 to 2.3.5
    2 `tinkerpop2/pom.xml` : change the version tag from 2.3.1 to 2.3.5
    3 `tinkerpop3/pom.xml`
        * change the version tag from 2.3.1 to 2.3.5
        * change the tinkerpop-version tag from 3.1.0-incubating to 3.2.0-incubating

* Then, finish the compilation and move the files: 
```sh
    mvn clean package -Dtp.version=3
    unzip target/neo4j-gremlin-plugin-tp3-2.3.5-server-plugin.zip -d $NEO4J_HOME/plugins/gremlin-plugin
    mate neo4j/conf/neo4j-server.properties
```

* Replace `dbms.security.auth_enabled=true` to `dbms.security.auth_enabled=false`

* Start neo4j server :    
```sh
    neostart
```

* You may call check that the server has GremlinPlugin available with 

```sh
    curl -s -G http://localhost:7474/tp/gremlin/execute
```

* Result should be : 

```json
    {
       "success": true
    }
```

* You may now removed the git repository for gremlin-plugin.
```sh
    cd ..
    rm -rf gremlin-plugin
    chmod 777 neo4j
    neostop
```


