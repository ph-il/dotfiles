#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v
echo

# If Homebrew is not installed
if ! which brew > /dev/null; then
     # Install Homebrew
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	 eval "$(/opt/homebrew/bin/brew shellenv)"
fi;

brew doctor
brew cleanup

brew tap Homebrew/bundle

brew bundle -v --file=Tapfile

brew update
brew upgrade

# Install everything in Brewfile
brew bundle -v

# Installs quick look plugins
brew cask install suspicious-package quicklook-json qlmarkdown qlstephen qlcolorcode

# qlImageSize
TMPDIR=`mktemp -d` && {
	cd $TMPDIR
	curl -o _.zip http://cloud.github.com/downloads/Nyx0uf/qlImageSize/qlImageSize.qlgenerator.zip
	unzip -d ~/Library/QuickLook _.zip
	rm -rf $TMPDIR
}

qlmanage -r

# git-friendly
curl -sS https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh | bash

# Extend global $PATH
echo -e "setenv PATH $HOME/Projects/dotfiles/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" | sudo tee /etc/launchd.conf

$(brew --prefix)/opt/fzf/install

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//')
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

#npm
npm config set loglevel warn
npm i -g npm-upgrade
npm i -g tldr
npm i -g yarn
npm i -g less
# Type `git open` to open the GitHub page or website for a repository.
npm i -g git-open
# fancy listing of recent branches
npm i -g git-recent
# sexy git diffs
npm i -g diff-so-fancy
# trash as the safe `rm` alternative
npm i -g trash-cli
npm i -g sprity sprity-sass
npm i -g eslint

## Configure MySQL
mysql_secure_installation
sudo mkdir /var/mysql
sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock

# Update global git config
git lfs install
# Update system git config
sudo git lfs install --system

sudo pip install https://github.com/google/closure-linter/zipball/master
sudo pip3 install detect-secrets

brew cleanup -s

