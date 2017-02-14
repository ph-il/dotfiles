#!/bin/bash

### XCode Command Line Tools
#      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

fi

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

#
# Install all the things with Homebrew, Casks and a Brewfile
#

if ! [ -d "${HOME}/Projects" ] 
then
    mkdir -pv Projects
fi;

# If Homebrew is not installed
if ! which brew > /dev/null; then
     # Install Homebrew 
     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;


# Install everything in Brewfile
brew doctor

brew tap Homebrew/bundle

brew bundle -v --file=Tapfile

brew update
brew upgrade

brew bundle -v 

brew bundle -v --file=Php55file
brew unlink php55
brew bundle -v --file=Php56file
brew unlink php56
brew bundle -v --file=Php70file
brew unlink php70
brew unlink php70-apcu
brew bundle -v --file=Php71file
brew bundle -v --file=Phpfile

brew bundle -v --file=Caskfile
brew bundle -v --file=Gemfile
brew bundle -v --file=Fontfile
brew bundle -v --file=Masfile


./bootstrap.sh

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

npm install -g bower
npm install -g less
# Type `git open` to open the GitHub page or website for a repository.
npm install -g git-open
# fancy listing of recent branches
npm install -g git-recent
# sexy git diffs
npm install -g diff-so-fancy
# trash as the safe `rm` alternative
npm install --global trash-cli

sudo easy_install Pygments

# Configure Blackfire
sudo blackfire-agent -register
ln -sfv /usr/local/opt/blackfire-agent/*.plist ~/Library/LaunchAgents

## Configure MySQL
mysql_secure_installation
sudo mkdir /var/mysql
sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock

# Update global git config
git lfs install
# Update system git config
sudo git lfs install --system


# Setup computer
./.macos

