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

brew bundle -v --file=~/Projects/dotfiles/setup/Tapfile

brew update
brew upgrade

# Install everything in Brewfile
brew bundle -v --file=~/Projects/dotfiles/setup/Brewfile

brew install homebrew-ffmpeg/ffmpeg/ffmpeg $(brew options homebrew-ffmpeg/ffmpeg/ffmpeg | grep -vE '\s' | grep -- '--with-' | grep -vi chromaprint | tr '\n' ' ')

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
N_PREFIX="$HOME/n"
n latest
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
[[ -d "/var/mysql" ]] || mkdir -pv /var/mysql
[[ -f "/tmp/mysql.sock" ]] && sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock

sudo pip3 install https://github.com/google/closure-linter/zipball/master
sudo pip3 install detect-secrets

brew cleanup -s

