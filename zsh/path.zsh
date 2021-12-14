# Prepend $PATH without duplicates
function _prepend_path() {
	if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
		PATH="$1:$PATH"
	fi
}

# Construct $PATH
# 1. Default paths
# 2. ./node_modules/.bin - shorcut to run locally installed Node bins
# 3. Custom bin folder for n, Ruby, CoreUtils, dotfiles, etc.
PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:./node_modules/.bin'
[ -d "$HOME/n/bin" ] && _prepend_path "$HOME/n/bin"
[ -d /usr/local/opt/ruby/bin ] && _prepend_path "/usr/local/opt/ruby/bin"
[ -d ~/.yarn/bin ] && _prepend_path "$HOME/.yarn/bin"
[ -d ~/.config/yarn/global/node_modules/.bin ] && _prepend_path "$HOME/.config/yarn/global/node_modules/.bin"
[ -d ~/.rbenv/bin ] && _prepend_path "$HOME/.rbenv/bin"
[ -d ~/.composer/vendor/bin ] && _prepend_path "$HOME/.composer/vendor/bin"
[ -d /usr/local/opt/coreutils/libexec/gnubin ] && _prepend_path "/usr/local/opt/coreutils/libexec/gnubin"
_prepend_path "/opt/homebrew/bin"
_prepend_path "/opt/homebrew/sbin"
[ -d ~/Projects/dotfiles/bin ] && _prepend_path "$HOME/dotfiles/bin"
[ -d ~/bin ] && _prepend_path "$HOME/bin"
export PATH
