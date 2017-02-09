# Ph-il’s (Philoupedia) dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/ph-il/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
##### PROJECTS ALIAS #####
 
# goto a specific project
alias gotest='gosf $PRJ_DIR/test/formation2 55 2'
alias gora='gosf $PRJ_DIR/rpgapi/ 70 3' 

##### ALIAS #####

##### CONFIG #####
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Philippe Gamache"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="philippe@ph-il.ca"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./install.sh
```
## Testing

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


## Some usefull commands

### Setup Hosts

* To update your .hosts file, execute:
```sh
cfghosts
```

### Setup PHP

* To update your .hosts file, execute:
```sh
cfgphp
```

### Update Tools 

* Execute:
```sh
toolsupdate
```

This will updates all tools.

## Feedback

Suggestions/improvements
[welcome](https://github.com/ph-il/dotfiles/issues)!

## Author

| [Follow @philoupedia on Twitter](http://twitter.com/philopedia/) |
|---|
| [Philippe Gamache](https://ph-il.ca/) |
|---|
| [Gnome Archivist](https://gnomearchiviste.ca/) |

## Thanks to…

* [Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles) for the base code and readme. All is thanks are also imprtant:  
  * @ptb and [his _OS X Lion Setup_ repository](https://github.com/ptb/Mac-OS-X-Lion-Setup)
  * [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
  * [Chris Gerke](http://www.randomsquared.com/) and his [tutorial on creating an OS X SOE master image](http://chris-gerke.blogspot.com/2012/04/mac-osx-soe-master-image-day-7.html) + [_Insta_ repository](https://github.com/cgerke/Insta)
  * [Cătălin Mariș](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
  * [Gianni Chiappetta](http://gf3.ca/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
  * [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
  * [Lauri ‘Lri’ Ranta](http://lri.me/) for sharing [loads of hidden preferences](http://osxnotes.net/defaults.html)
  * [Matijs Brinkhuis](http://hotfusion.nl/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
  * [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
  * [Sindre Sorhus](http://sindresorhus.com/)
  * [Tom Ryder](https://sanctum.geek.nz/) and his [dotfiles repository](https://sanctum.geek.nz/cgit/dotfiles.git/about)
  * [Kevin Suttle](http://kevinsuttle.com/) and his [dotfiles repository](https://github.com/kevinSuttle/dotfiles) and [OSXDefaults project](https://github.com/kevinSuttle/OSXDefaults), which aims to provide better documentation for [`~/.macos`](https://mths.be/macos)
  * [Haralan Dobrev](http://hkdobrev.com/)
  * anyone who [contributed a patch](https://github.com/mathiasbynens/dotfiles/contributors) or [made a helpful suggestion](https://github.com/mathiasbynens/dotfiles/issues)
* [Paul Irish](http://paulirish.com) and his [dotfiles repository](https://github.com/paulirish/dotfiles)
* [Jean-Christophe Lauffer](https://github.com/jclauffer) for lot of code in my original .profile
* [Damien Seguy](http://exakat.io) for the [Exakat config](https://github.com/dseguy)

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


