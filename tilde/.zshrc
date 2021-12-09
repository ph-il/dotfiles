# Load the shell dotfiles, and then some:
# * ~/Projects/dotfiles/zsh/path can be used to extend `$PATH`.
# * ~/.zshlocal can be used for other settings you don’t want to commit.

for file in ~/Projects/dotfiles/zsh/{env,path,aliases,completions,key-bindings}.zsh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Do not overwrite files when redirecting using ">". Note that you can still override this with ">|"
set -o noclobber

eval "$(/opt/homebrew/bin/brew shellenv)"

# Case-insensitive globbing (used in pathname expansion)
setopt NO_CASE_GLOB;

# Auto change directories
setopt AUTO_CD

# history file
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# ignore lines starting with a space - useful when using password in command lines
setopt HIST_IGNORE_SPACE
# Show command with history expansion to user before running it
setopt HIST_VERIFY

# Terminal title
DISABLE_AUTO_TITLE="true"
function _set_terminal_title() {
	local title="$(basename "$PWD")"
	if [[ -n $SSH_CONNECTION ]]; then
		title="$title \xE2\x80\x94 $HOSTNAME"
	fi
	echo -ne "\033];$title\007"
}
precmd_functions+=(_set_terminal_title)

# Correct commands
setopt CORRECT
# Correct all arguments
setopt CORRECT_ALL

# Correction prompt
SPROMPT="Correct %F{red}%R%f to %F{green}%r%f [(n)o,(y)es,(a)bort,(e)dit]?"

# Enable zsh-syntax-highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable fzf: https://github.com/junegunn/fzf
# Use fd (https://github.com/sharkdp/fd) to respect .gitignore
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--color bg:-1,bg+:-1,fg:-1,fg+:#feffff,hl:#993f84,hl+:#d256b5,info:#676767,prompt:#676767,pointer:#676767"
# Use fd to respect .gitignore and exclude .git directory
_fzf_compgen_path() {
  fd --hidden --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" . "$1"
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load extra (private) settings
[ -f ~/.zshlocal ] && source ~/.zshlocal

if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi
