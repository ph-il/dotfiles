#!/bin/bash

source ~/.profile;

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

# Configure Blackfire
# sudo blackfire-agent -register
# ln -sfv /usr/local/opt/blackfire-agent/*.plist ~/Library/LaunchAgents

## Configure MySQL
mysql_secure_installation
sudo mkdir /var/mysql
sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock

# Update global git config
git lfs install
# Update system git config
sudo git lfs install --system


# Configure PHP
sudo chmod -R guo+rw  /usr/local/etc/php/8.0/conf.d
cp ./php/8.0/conf.d/*.ini /usr/local/etc/php/8.0/conf.d/
