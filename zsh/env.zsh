#!/usr/bin/env zsh

# Please change if you're using an other directory for Projects
export PRJ_DIR="${HOME}/Projects"

# Make vim the default editor.
#export EDITOR='vim';

# Make Textmate the default editor.
export EDITOR="/usr/local/bin/mate -w"

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';
export NODE_OPTIONS="--max-old-space-size=10240"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Autoconf for PHP
export PHP_AUTOCONF=/usr/local/Cellar/autoconf/2.69/bin/autoconf

# DEV_ENV use in many script
export DEVENV_NAME="none"
export DEVENV_PROG="donotrun"
export DEVENV_CACHE="none"
export DEVENV_LOG="none"

# Current PHP version
export PHP_VERSION="`php -r \"error_reporting(0); echo str_replace('.', '', substr(phpversion(), 0, 3));\"`"

export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_16_HOME=$(/usr/libexec/java_home -v16)
export JAVA_OPTIONS="-Xms64m -Xmx16288m"
export JAVA_OPTS="-Xss16288k"

export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=127.0.0.1 remote_connect_back=0"
export PHP_IDE_CONFIG="serverName=127.0.0.1"

export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# here's LS_COLORS
# github.com/trapd00r/LS_COLORS
command -v gdircolors >/dev/null 2>&1 || alias gdircolors="dircolors"
eval "$(gdircolors -b ~/.dircolors)"

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

export APPLE_SILICON=true

