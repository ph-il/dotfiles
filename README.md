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
brew tap Homebrew/bundle
brew doctor
brew bundle
```
Please correct the problems brew doctor will give you. It might be different for every body.
	

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
## Install MySQL

* Execute
```sh
mysql_secure_installation
sudo mkdir /var/mysql
sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock
```

* To restart MySql after an upgrade:
```sh
mysqlrestart
```

* To connect run:
```sh
mysql -uroot
```

## Install PHP 

We install different versions of PHP so we can switch between them for development and help to run every test in Exakat.


### Test PHP 5.5

* Execute
```sh
$(brew --prefix homebrew/php/php55)/bin/php -i "(command-line 'phpinfo()')"
```

* Make sure that everyting is working

### Test PHP 5.6

* Execute
```sh
$(brew --prefix homebrew/php/php56)/bin/php -i "(command-line 'phpinfo()')"
```

* Make sure that everyting is working


### Test PHP 7.0

* Execute
```sh
$(brew --prefix homebrew/php/php70)/bin/php -i "(command-line 'phpinfo()')"
```

* Make sure that everyting is working

### Test PHP 7.1

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

* Update ALL PHP Init files
* Please change information for YOUR region.
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


## Install Bower

* Execute
```sh
sudo npm install -g bower
```
## Install Less

* Execute
```sh
sudo npm install -g less
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


