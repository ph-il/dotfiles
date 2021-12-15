#!/usr/bin/env zsh

# Please change if you're using an other directory for Projects
export PRJ_DIR="${HOME}/Projects"

# Make vim the default editor.
#export EDITOR='vim';

# Make Textmate the default editor.
export EDITOR='/usr/local/bin/mate -w'

export N_PREFIX="$HOME/n"

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';
export NODE_OPTIONS="--max-old-space-size=10240"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Autoconf for PHP
export PHP_AUTOCONF=/opt/homebrew/Cellar/autoconf/2.71/bin/autoconf

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

# Make less the default pager, add some options and enable syntax highlight using source-highlight
[ -n "$LESSPIPE" ] && export LESSOPEN="| ${LESSPIPE} %s"
less_options=(
	# If the entire text fits on one screen, just show it and quit. (Be more
	# like "cat" and less like "more".)
	--quit-if-one-screen

	# Do not clear the screen first.
	--no-init

	# Like "smartcase" in Vim: ignore case unless the search pattern is mixed.
	--ignore-case

	# Do not automatically wrap long lines.
	--chop-long-lines

	# Allow ANSI colour escapes, but no other escapes.
	--RAW-CONTROL-CHARS

	# Do not ring the bell when trying to scroll past the end of the buffer.
	--quiet

	# Do not complain when we are on a dumb terminal.
	--dumb
);
export LESS="${less_options[*]}"
export PAGER='less'

# Highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb="\e'[01;31m'"       # begin blinking
export LESS_TERMCAP_md="\e'[01;38;5;74m'"  # begin bold
export LESS_TERMCAP_me="\e'[0m'"           # end mode
export LESS_TERMCAP_se="\e'[0m'"           # end standout-mode
export LESS_TERMCAP_so="\e'[38;5;246m'"    # begin standout-mode - info box
export LESS_TERMCAP_ue="\e'[0m'"           # end underline
export LESS_TERMCAP_us="\e'[04;38;5;146m'" # begin underline

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'

# here's LS_COLORS
# github.com/trapd00r/LS_COLORS
command -v gdircolors >/dev/null 2>&1 || alias gdircolors="dircolors"
eval "$(gdircolors -b ~/.dircolors)"

# Grep colors
export GREP_COLOR='1;33'

# Bat: https://github.com/sharkdp/bat
export BAT_THEME="DarkNeon"

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

export APPLE_SILICON=true

# git-friendly: disable bundle after pull
export GIT_FRIENDLY_NO_BUNDLE=true

# git-friendly: disable URL copying after push
export GIT_FRIENDLY_NO_COPY_URL_AFTER_PUSH=true

if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi
