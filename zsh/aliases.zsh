# Enable aliases to be sudo’ed
alias sudo="sudo "

# Shortcuts
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias doc="cd ~/Documents"
alias dt="cd ~/Desktop"
alias p='cd "${PRJ_DIR}"'
alias goprj='cd "${PRJ_DIR}"'
alias h="history"
alias j="jobs"
alias gogd="cd ~/Google\ Drive/"
alias e="$EDITOR"
alias m="$EDITOR"

alias where=which # sometimes i forget

# AFK Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# ag
alias ag='ag -f --hidden'

# alias
alias mkalias="$EDITOR ~/.zshlocal"
alias runalias="source ~/.zshrc"
alias godf="source devenv $PRJ_DIR/dotfiles"
alias mkdf=""$EDITOR $PRJ_DIR/dotfiles
alias goto='alias | grep go'

# Apache
alias apachectl='sudo apachectl'
alias apache2ctl='sudo apachectl'
alias apache.cfg="$EDITOR /opt/homebrew/etc/httpd/"
alias apache.restart='brew services restart httpd'
alias apache.start='brew services run httpd'
alias apache.stop='brew services stop httpd'

# Bat: https://github.com/sharkdp/bat
command -v bat >/dev/null 2>&1 && alias cat="bat --style=numbers,changes"

# BlackFire
alias blackfire.start='brew services run blackfireio/blackfire/blackfire-agent'
alias blackfire.stop='brew services stop blackfireio/blackfire/blackfire-agent'

# cd - help change directory
# Easier navigation: ..., ...., .....
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cdf="cdfinder"

# chmod
alias chmox='chmod -x'

# clean all [filename in argument] from one directory and sub-directory
alias clean.all='sudo find . -name $1 -print0 | xargs -0 sudo rm -rf '
alias clean.cvs="find . -type f -name csv -ls -delete"
alias clean.cvsi="find . -type f -name .cvsignore -ls -delete"
alias clean.err="find . -type f -name php_errors.log -ls -delete"
alias clean.sccs="find . -type f -name SCCS -ls -delete"
alias clean.svn="find . -type f -name .svn -ls -delete"
alias clean.tdb="find . -type f -name Thumbs.db -ls -delete"
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias clean.url="find . -type f -name *.url -ls -delete"
# Empty the Trash on all mounted volumes and the main HDD.
# Then, clear the useless sleepimage.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash=" \
    sudo rm -rfv /Volumes/*/.Trashes; \
    rm -rfv ~/.Trash/*; \
    sudo rm -rfv /private/var/log/asl/*.asl; \
    sudo rm -v /private/var/vm/sleepimage; \
    rm -rv \"/Users/philippegamache/Library/Application Support/stremio/Cache\";  \
    rm -rv \"/Users/philippegamache/Library/Application Support/stremio/stremio-cache\"; \
    sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent' \
"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Composer
alias cup='composer update --prefer-dist'
alias ci='composer require --prefer-dist'
alias crc='XDEBUG_MODE=off php ~/.composer/vendor/bin/composer-require-checker'

# df - Better display free disk space with "Human-readable" output.
alias df="df -h"

# deployer
alias dep='vendor/bin/dep'

# Directory
# Mkdir with Create intermediate directories and Verbose
alias mkd="mkdir -pv"
# Remove dir (like rm -rf)
alias rmd="rmdir"

# Files mv, rm, cp
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -i -v'
alias fs='filesize'

# git
alias g="git"
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gd='git diff --no-index --color-words "$@"| $EDITOR'
alias gl='git pull'
alias gp='git push'
# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'
alias gst='git status'
alias gsp='git submodule foreach git pull'
alias master="git checkout master"
alias main="git checkout main"
alias push="git push"
# Undo a git push`
alias undopush="git push -f origin HEAD^:main"

# GitHub Desktop
alias gh="github ."

# grep
# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Grunt
# Make Grunt print stack traces by default
command -v grunt > /dev/null && alias grunt="grunt --stack"

# hightlight
alias hl.php="pbpaste | highlight --syntax=php -O rtf --style candy | pbcopy"
alias hl.html="pbpaste | highlight --syntax=html -O rtf --style candy| pbcopy"
alias hl.apache="pbpaste | highlight --syntax=httpd -O rtf --style candy| pbcopy"
alias hl.js="pbpaste | highlight --syntax=js -O rtf --style candy| pbcopy"

# host names
alias hosts.cfg='sudo $EDITOR /etc/hosts'

# java
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java16='export JAVA_HOME=$JAVA_16_HOME'

# jenkins
alias jk.restart='brew services restart jenkins'
alias jk.start='brew services run jenkins'
alias jk.stop='brew services stop jenkins'

# ls alias to help
alias ls='ls -FhG ${colorflag}'
alias ll='ls -FhlG ${colorflag}'
alias la='ls -FhlGaA ${colorflag}'
alias lt='ls -FhlGtr ${colorflag}'
alias l.='ls -FhlGtrd .* ${colorflag}'
alias dir="lt"
alias dot="l."
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Memcached
alias mem.restart='brew services restart memcached'
alias mem.start='brew services run memcached'
alias mem.stop='brew services stop memcached'
alias mem.reset="echo 'flush_all' | nc localhost 11211"
alias mem.stats="echo 'stats' | nc localhost 11211"

# Mysql
alias mysql.restart='brew services restart mysql'
alias mysql.start='brew services run mysql'
alias mysql.stop='brew services stop mysql'
alias mysql.cfg="$EDITOR /etc/my.cnf"

# Network
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# PATH
# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\n}"

# php
alias php.cfg="$EDITOR /opt/homebrew/etc/php"
# Load xdebug Zend extension with php command
# alias php='php -dzend_extension=xdebug.so'
# PHPUnit needs xdebug for coverage. In this case, just make an alias with php command prefix.
#alias phpunit='php $(which phpunit)'

# PhpStorm
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'

# redis
alias redis.restart='brew services restart redis'
alias redis.start='brew services run redis'
alias redis.stop='brew services stop redis'

# RabbitMQ
alias rmq.restart='brew services restart rabbitmq'
alias rmq.start='brew services run rabbitmq'
alias rmq.stop='brew services stop rabbitmq'

# sed - Better use RegEx in sed
alias sed='sed -E'

# Services
alias stopall='brew services stop --all'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# Show/hide desktop icons (useful when presenting)
alias hide.desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show.desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Spotlight
alias spot.off="sudo mdutil -a -i off"
alias spot.on="sudo mdutil -a -i on"

# svn
alias svnup='svn up --ignore-externals'
alias svnst='svn st --ignore-externals'

# symfony 5 and 6 project command (need to use the go function before)
alias sfcc='sf cache:clear --no-warmup'
alias sfcw='sf cache:warmup'
# Dangerous @TODO Create a function that will be more safe
alias sfhcc='sudo rm -rf "${DEVENV_CACHE}*"'
alias sfcl='sudo find "${DEVENV_LOG}" -type f -delete'
alias sfcxh='sudo find "${DEVENV_LOG}xhprof/" -type f -delete'
alias sfddd='sf doctrine:database:drop --force'
alias sfddc='sf doctrine:database:create'
alias sfdsc='sf doctrine:schema:create'
alias sfdsd='sf doctrine:schema:drop --force --full-database'
alias sfdsv='sf doctrine:schema:validate'
alias sfdfl='sf doctrine:fixtures:load'
alias sfdmc='sf doctrine:migrations:generate'
alias sfdmg='sf doctrine:migrations:generate'
alias sfdmm='sf doctrine:migrations:migrate'
alias sfroute='sf debug:router'
alias sfs='symfony serve -d'
alias sfcontainer='sf debug:container'
alias sfdev='sf --env=dev'
alias sfprod='sf --env=prod'
alias sfmc='sf make:controller'
alias sfmcom='sf make:command'
alias sfmm='sf make:migration'

# Terminal
# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias -g badge="tput bel"

# Timer
# Get week number
alias week='date +%V'
# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# trash-cli: https://github.com/sindresorhus/trash-cli
[ -d ~/dotfiles/node_modules/trash-cli ] && alias rm="~/dotfiles/node_modules/trash-cli/cli.js"

# Vagrant
alias v="vagrant global-status"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"

# varnish
alias varnish.restart='brew services restart varnish'
alias varnish.start='brew services run varnish'
alias varnish.stop='brew services stop varnish'

# XDebug
alias xdebug.enable="xdebug-toggle on --no-server-restart"
alias xdebug.disable="xdebug-toggle off --no-server-restart"

# Suffix Alias
alias -s txt "mate"
alias -s log "tail -f"
