#!/bin/bash

source ~/.profile;

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

# Configure Blackfire
#sudo blackfire-agent -register
ln -sfv /usr/local/opt/blackfire-agent/*.plist ~/Library/LaunchAgents

## Configure MySQL
mysql_secure_installation
sudo mkdir /var/mysql
sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock

# Update global git config
git lfs install
# Update system git config
sudo git lfs install --system

# Configure MongoDB
if ! [ -d "/data/db" ]
then
    sudo mkdir -p /data/db
    sudo chown -R `id -un` /data/db
fi;

# Configure PHP
sudo chmod -R guo+rw  /usr/local/etc/php/5.6/conf.d
sudo chmod -R guo+rw  /usr/local/etc/php/7.0/conf.d
sudo chmod -R guo+rw  /usr/local/etc/php/7.1/conf.d
sudo chmod -R guo+rw  /usr/local/etc/php/7.2/conf.d
cp ./Apache/zz_personal.ini /usr/local/etc/php/5.6/conf.d/zz_personal.ini
cp ./Apache/zz_personal.ini /usr/local/etc/php/7.0/conf.d/zz_personal.ini
cp ./Apache/zz_personal.ini /usr/local/etc/php/7.1/conf.d/zz_personal.ini
cp ./Apache/zz_personal.ini /usr/local/etc/php/7.2/conf.d/zz_personal.ini

# Configure Docker
#docker-machine create -d virtualbox dev
#eval "$(docker-machine env dev)"

# Configure Apache

apacheRoot=`httpd -V | grep -i httpd_root | cut -d '"' -f 2`
apacheConf=`httpd -V | grep -i server_config_file | cut -d '"' -f 2`

sudo chmod -R guo+rw ${apacheRoot}/extra
sudo mkdir ${apacheRoot}/other
sudo chmod -R guo+rw ${apacheRoot}/other
sudo chmod -R guo+rw $apacheConf

COMM='s/username/'$(whoami)'/g'
for i in ${apacheRoot}/other/*.conf
  do
    sudo sed -i -e $COMM "$i"
done

PATTERN="# Brew PHP LoadModule for 'sphp' switcher"

if grep -q "$PATTERN" $apacheConf;
 then
    echo "sphp is already set"
 else
    sudo sed -i -e '/libphp5.so/d' $apacheConf
    sudo echo "LoadModule php7_module /usr/local/lib/libphp7.so" >> $apacheConf
fi

PATTERN="/usr/local/etc/apache2/2.4/other/*.conf"

if grep -q $PATTERN $apacheConf;
 then
    echo "other conf is already set"
 else
    sudo echo "" >> $apacheConf
    sudo echo "$PATTERN" >> $apacheConf
fi

PATTERN="DirectoryIndex index.html"

if grep -q "$PATTERN" $apacheConf;
 then
    sudo echo "" >> $apacheConf
    sudo sed -i -e "s/$PATTERN/DirectoryIndex index.php index.html/g" $apacheConf
 else
    echo "DirectoryIndex is already set"
fi

sudo sed -i -e "/LoadModule rewrite_module/s/^#*//" $apacheConf
sudo perl -i -0pe "s/    AllowOverride none\n    Require all denied\n/    Options FollowSymLinks Multiviews Indexes\n    AllowOverride All\n    Require all granted\n/" $apacheConf
sudo echo "" >> $apacheConf
sudo echo "Options FollowSymLinks Multiviews Indexes" >> $apacheConf

sudo perl -i -0pe "s/    AllowOverride none\n    Require all denied\n/    Options FollowSymLinks Multiviews Indexes\n    AllowOverride All\n    Require all granted\n/" $apacheConf
sudo sed -i -e 's/User _www/User '$(whoami)'/g' $apacheConf
sudo sed -i -e 's/Group _www/Group staff/g' $apacheConf

PATTERN="SetHandler application/x-httpd-php"
if grep -q "${PATTERN}" $apacheConf;
 then
    echo "PHP is already set"
 else
    sudo echo "" >> $apacheConf
    sudo echo "<FilesMatch \.php$>" >> $apacheConf
    sudo echo '    '${PATTERN} >> $apacheConf
    sudo echo "</FilesMatch>" >> $apacheConf
fi

sudo cp -v $(apacheRoot)/homebrew.mxcl.httpd24.plist /Library/LaunchDaemons
sudo chown -v root:wheel /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
sudo chmod -v 644 /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist

sudo ln -sf /usr/local/opt/php71/libexec/apache2/libphp7.so /usr/local/lib/libphp7.so
apachectl -k restart
