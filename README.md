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
```console
cd
mkdir -pv projects
```

## Install Alias and Configuration for the Command Line.

* Check with `ls ~/.profile`, if you have a .profile file
* If you have one, rename it (i.e. profile.txt ), then you’ll be able to your .bashrc file. We use .bashrc for your own configuration, and .profile for this install and any updates of installation and alias.
* Copy .profile in your home directory
```console
cp profile.txt ~/.profile
```
	
* Execute
```console
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
brew update
brew upgrade
```
	
Please correct the problems brew doctor will give you. It might be different for every body.

## Install tools, git & newer version of autoconf

* Execute
```console
brew install autoconf git ack wget curl redis memcached libmemcached colordiff imagemagick icoutils gettext icu4c libxml2 unixodbc readline bash-git-prompt
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

## Install Memcached

As memcached is  usefull and will be used in some of our tools, it's already installed. But : 

* To restart memcached after an upgrade:
```console
brew services restart memcached
```

* Or, if you don't want/need a background service you can just run:
```console
memstart
```

## Install MySQL
* Execute

```console
brew install mysql
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
mysqladmin -u root password pwroot
mysqladmin -u root -ppwroot -h localhost password pwroot
mysqladmin -u root -ppwroot reload
history -c
sudo mkdir /var/mysql
sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock
```





