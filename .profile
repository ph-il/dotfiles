##### local variable #####
 
# Please change if you're using an other directory for Projects
export PRJ_DIR='~/projects'

##### Environment variables #####
 
export PHP_AUTOCONF=/usr/local/Cellar/autoconf/2.69/bin/autoconf
export PHPRC=/usr/local/php5/cli-cfg
export PHP_INI_SCAN_DIR=/usr/local/php5/cli-cfg/php.d
export EDITOR="/usr/local/bin/mate -w"

export PATH="/usr/local/php5/bin:$(brew --prefix)/bin:~/.composer/vendor/bin:$PATH"

#export JAVA_HOME=$(/usr/libexec/java_home) 
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_74.jdk/Contents/Home" 
export NEO4J_HOME="/Users/philippe/projects/tools/exakat/neo4j"

 
# configuring GIT
if [ -d $(/usr/local/bin/brew --prefix)/etc/bash_completion.d ]; then
  source $(/usr/local/bin/brew --prefix)/etc/bash_completion.d/git-completion.bash
  source $(/usr/local/bin/brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi
# Voir git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_SHOWSTASHSTATE=yes
export GIT_PS1_SHOWUNTRACKEDFILES=yes
export GIT_PS1_SHOWUPSTREAM=verbose
export GIT_PS1_DESCRIBE_STYLE=branch
export GIT_PS1_SHOWCOLORHINTS=yes
  
# Réglages de VCS (svn et git)
function vcs_info() {
  local dir="$PWD"
  local vcs
  local nick
  while [[ "$dir" != "/" ]]; do
    for vcs in git svn; do
      if [[ -d "$dir/.$vcs" ]] && hash "$vcs" &>/dev/null; then
        case "$vcs" in
          git) __git_ps1 "${1:-(%s) }"; return;;
          svn) depot=$(svn info 2>/dev/null\
                | grep -e '^Repository Root:'\
                | sed -e 's#.*/##')
               version=$(svn info 2>/dev/null\
                | grep -e '^Revision:'\
                | awk '{print $2}')
               [ -n "$(svn status --ignore-externals | grep -Ev '^X')" ] && dirty=" *" || dirty=""
               nick="$depot:$version$dirty"
          ;;
        esac
        [[ -n "$nick" ]] && printf "${1:-(%s) }" "$nick"
        return 0
      fi
    done
    dir="$(dirname "$dir")"
  done
}
 
# Couleurs
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
  COLOR_NONE="\[\e[0m\]"
  
export PS1=${YELLOW}'\u'${COLOR_NONE}'@'${GREEN}'phil-x'${COLOR_NONE}':'${BLUE}'\w'${COLOR_NONE}' $(vcs_info "$2")'${YELLOW}'\$'${COLOR_NONE}' '
export PS2=${YELLOW}'> '${COLOR_NONE}
 
##### ALIAS #####
  
# alias
alias mkalias='mate ~/.bashrc ~/.profile'
alias runalias='source ~/.profile'
 
# Apache
alias apachectl='sudo /usr/sbin/apachectl'
alias apache2ctl='sudo /usr/sbin/apachectl'
alias cfgapache='mate /etc/apache2'
 
# cd - help change directory
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
 
# clean all [filename in argument] from one directory and sub-directory
alias cleanall='sudo find . -name $1 -print0 | xargs -0 sudo rm -rf '

alias ccurl='find . -name *.url -print0 | xargs -0 sudo rm -rf '
alias ccvs='find . -name cvs -print0 | xargs -0 sudo rm -rf '
alias ccvsi='find . -name .cvsignore -print0 | xargs -0 sudo rm -rf '
alias cds='find . -name .DS_Store -print0 | xargs -0 sudo rm -rf '
alias cerr='find . -name php_errors.log -print0 | xargs -0 sudo rm -rf '
alias csccs='find . -name SCCS -print0 | xargs -0 sudo rm -rf '
alias csvn='find . -name .svn -print0 | xargs -0 sudo rm -rf '
alias ctdb='find . -name Thumbs.db -print0 | xargs -0 sudo rm -rf '

# Composer
alias cup='composer update --prefer-dist'
alias ci='composer install --prefer-dist'
 
# df - Better display free disk space with "Human-readable" output.
alias df="df -h"
 
#git
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gd='git diff | mate'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias gsp='git submodule foreach git pull' 

# hightlight
alias hlphp="pbpaste | highlight --syntax=php -O rtf | pbcopy"
alias hlhtml="pbpaste | highlight --syntax=html -O rtf | pbcopy"
alias hlapache="pbpaste | highlight --syntax=httpd -O rtf | pbcopy"
alias hljs="pbpaste | highlight --syntax=js -O rtf | pbcopy" 
 
# host names
alias cfghosts='mate /etc/hosts'
  
# ls alias to help
alias ls='ls -FhG'
alias ll='ls -FhlG'
alias la='ls -FhlGA'
alias lt='ls -FhlGtr'
alias l.='ls -FhlGtrd .*'
alias dir="lt"
alias dot="l."
 
# Memcache
alias memstart='memcached -d'
alias memstop='sudo killall -TERM memcached'
alias memreset="echo 'flush_all' | nc localhost 11211"
alias memstats="echo 'stats' | nc localhost 11211"
 
# Mkdir with Create intermediate directories and Verbose
alias mkd="mkdir -pv"
 
# Mysql
alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'
alias cfgmysql='mate /etc/my.cnf'

# neo4j
alias neostart='$NEO4J_HOME/bin/neo4j start'
alias neostop='$NEO4J_HOME/bin/neo4j stop'

# php
alias cfgphp='mate /usr/local/php5/'
# Load xdebug Zend extension with php command
#alias php='php -dzend_extension=xdebug.so'
# PHPUnit needs xdebug for coverage. In this case, just make an alias with php command prefix.
#alias phpunit='php $(which phpunit)'

# php Code Sniffer
alias cs='phpcs --ignore=*/SCCS/*,*/vendor/*,*/.svn/*,*/base/*,*/templates/* --standard=PSR2'
alias csf='php-cs-fixer fix --level=all'
 
# Remove dir (like rm -rf)
alias rmd="rmdir"
 
# sed - Better use RegEx in sed
alias sed='sed -E'
 
# show hidden in finder (OSX only)
alias seehide='defaults write com.apple.finder AppleShowAllFiles TRUE'
alias hidehide='defaults write com.apple.finder AppleShowAllFiles FALSE'
 
# svn
alias svnup='svn up --ignore-externals'
alias svnst='svn st --ignore-externals'
  
# see default project
alias dspdefault='ls /etc/apache2/other/*.default'
alias dspdef='dspdefault'
 
# symfony 1+ project command (need to use the go function before)
alias sf='$SF_PROG'
alias sfcc='sf cache:clear'
alias sfhcc='sudo rm -rf ${SF_CACHE}*'
alias sfcl='sudo find ${SF_LOG} -type f -delete'
alias sfcxh='sudo find ${SF_LOG}xhprof/ -type f -delete'
 
# symfony 1 only project command (need to use the go function before)
alias sfpi='sf plugin:install'
alias sfpibeta='sf plugin:install --stability=beta'
alias sfschema='~/Scripts/sfschema.sh'
  
# Symfony 2+ project only command (need to use the go function before)
alias sfddd='sf doctrine:database:drop --force'
alias sfddc='sf doctrine:database:create'
alias sfdsc='sf doctrine:schema:create'
alias sfload='sf doctrine:fixtures:load'
 
 
# Functions replacing external scripts
# This is use to upgrade many of the command line tools we'll add.
# Usage: toolsupdate
toolsupdate() {
    brew update
    brew upgrade
    composer selfupdate
    composer global update
	symfony self-update
    sudo pear upgrade PEAR
    sudo pear upgrade-all
    sudo pecl upgrade-all
    sudo gem update
}
 
# Defining a default project
# Usage: gosf 'project directory' 'symfony version' 'project configuration name in apache'
gosf() {
    cd "${1}"
    PRJ_SF="${1}"
    export PRJ_SF
    if [ "$2" == 3 ]
    then
        SF_PROG="php $PRJ_SF/bin/console"
        SF_CACHE="$PRJ_SF/var/cache/"
        SF_LOG="$PRJ_SF/var/log/"
	elif [ "$2" == 2 ]
    then
        SF_PROG="php $PRJ_SF/app/console"
        SF_CACHE="$PRJ_SF/app/cache/"
        SF_LOG="$PRJ_SF/app/log/"
    else
        SF_PROG="$PRJ_SF/symfony"
        SF_CACHE="$PRJ_SF/cache/"
        SF_LOG="$PRJ_SF/log/"
    fi
    export SF_PROG
    export SF_CACHE
    export SF_LOG
 
    if [[ "$3" != "" && "$3" != "none" ]]
    then
        for i in /etc/apache2/other/*.default
        do
            sudo mv $i ${i%default}conf
        done
        sudo cp /etc/apache2/other/"${3}".conf /etc/apache2/other/000.default.conf
        sudo mv /etc/apache2/other/"${3}".conf /etc/apache2/other/"${3}".default
        apachectl restart
    fi
}
# This is use for symfony 1.x projects.
# If you are using many schema files, it will add a list of all files to your schema.yml
# Usage: sfschema
sfschema() {
    cd ${PRJ_SF}
    cd config/doctrine/
    echo
    for i in $(ls *.yml)
    do
        echo "##### $i #####"; grep -v '^ ' $i | grep -v '^$' | grep -v '^#' | sed 's/://g' | sed 's/^/# /g'
        echo
    done >> schema.yml
}

# Include ~/.bashrc for personal aliases
if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi
