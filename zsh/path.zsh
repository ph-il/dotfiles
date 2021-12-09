#export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.yarn/bin::$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin::$PATH"
export PATH="$HOME/.rbenv/bin::$PATH"
export PATH="$HOME/.composer/vendor/bin::$PATH"
#export PATH="$(brew --prefix)/bin::$PATH"
#export PATH="$(brew --prefix)/sbin::$PATH"
export PATH="$HOME/bin::$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# Our fpath
fpath+=${PRJ_DIR}/dotfiles/zshfunctions
