#!/bin/bash


if ! [ -d "${HOME}/.nvm" ] 
then
    mkdir -pv ~/.nvm
fi;

npm install -g yarn
npm install -g less
# Type `git open` to open the GitHub page or website for a repository.
npm install -g git-open
# fancy listing of recent branches
npm install -g git-recent
# sexy git diffs
npm install -g diff-so-fancy
# trash as the safe `rm` alternative
npm install -g trash-cli

npm install -g sprity sprity-sass 

sudo easy_install Pygments

npm install -g eslint
eslint --init

sudo easy_install pip3
sudo pip install https://github.com/google/closure-linter/zipball/master
sudo pip3 install detect-secrets

