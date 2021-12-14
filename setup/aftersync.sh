#!/usr/bin/env zsh

$(brew --prefix)/opt/fzf/install

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//')
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

#npm
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

# Update global git config
git lfs install
# Update system git config
sudo git lfs install --system
