# Ph-il’s (Philoupedia) dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code,
and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails.
Use at your own risk!

### Using Git and the sync script

You can clone the repository wherever you want. I like to keep it in `~/Projects/dotfiles`.
The sync script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/ph-il/dotfiles.git && cd dotfiles && sync.py
```

### Update to zsh from bash

MacOS now use zsh as the default shell. In you updated your version, you might still be on bash. Then new version of
this dotfiles is using bash.

```bash
chsh -s /bin/zsh
```
### Every step to install on a new mac

Just run those command one by one.

```bash
# Base installation
./setup/install.sh
# Installs Homebrew, Git, git-extras, git-friendly, hub, Node.js, etc.
./setup/stuff.sh
# Installs PHP 7.0, 7.1, 7.2, 7.3, 7.4
./setup/php7.sh
# Installs PHP 8, 8.1. Main PHP 8.0 for now
./setup/php.sh
./sync.py
source ~/.zshrc
# Needed after sync when doing a full install (stuff.sh)
./setup/aftersync.sh
# Installs tools. Main PHP 8.0 for now
./setup/phptools.sh
./setup/exakat.sh
./setup/maxos.sh
brew bundle -v --file=./setup/Fontfile
```

### Specify the `$PATH`

If `~/dotfiles/zsh/path.zsh` exists, it will be sourced along with the other files.

Here’s an example `~/dotfiles/zsh/path.zsh` file that adds `/usr/local/bin` to the `$PATH`:

```bash
[ -d /usr/local/bin ] && _prepend_path "/usr/local/bin"
```

### Add custom commands without creating a new fork

If `~/.zshlocal` exists, it will be sourced along with the other files. You can use this to add a few custom commands
without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.zshlocal` looks something like this:

```bash
##### PROJECTS ALIAS #####

# goto a specific project
alias gotest='gosf $PRJ_DIR/test/formation2 74 sf3'
alias godf='godf $PRJ_DIR/dotfiles/ none none'

##### ALIAS #####

##### CONFIG #####

```

You could also use `~/.zshlocal` to override settings, functions and aliases from my dotfiles repository.
It’s probably better to [fork this repository](https://github.com/ph-il/dotfiles/fork) instead, though.

### Git credentials

Not in the repository, to prevent people from accidentally committing under my name

You should create a .gitconfig.local to add your own local configuration and your personnal informations.

```bash
git config -f ~/.gitconfig.local user.email "author@email.com"
git config -f ~/.gitconfig.local user.name "Author Name"
```

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults and Applications:

```bash
./maxos.sh
```

## Updates

### Update Tools

Get macOS software updates, update Homebrew, npm, Ruby packages, dotfiles and some other software

* Execute:
```sh
update
```

### Update sensible macOS defaults

```bash
./macos.sh
```

### Add new applications you'll want to keep

When some application need to be add, put it in the Brewfile, save in your git, then run:

```bash
update
```

## Testing

### Test PHP 8

* Execute
```sh
php -i "(command-line 'phpinfo()')"
```

* Make sure that everyting is working

### Test Exakat

* You may call check that the server has GremlinPlugin available with

```sh
curl -s -G http://localhost:7474/tp/gremlin/execute
```

* Result should be :

```json
    {
       "success": true
    }
```

* You can check Exakat Installation
```sh
go.exakat
exakat doctor
```

## Some usefull commands

### Setup Hosts

* To update your .hosts file, execute:
```sh
cfg.hosts
```

### Setup PHP

* To update your php config files, execute:
```sh
cfg.php
```

### Setup Apache

* To update your apache config files, execute:
```sh
cfg.apache
```

### Start PHP Server

* Execute:
```sh
phpserver
```

## Feedback

Suggestions/improvements
[welcome](https://github.com/ph-il/dotfiles/issues)!

## Author

[Follow @philoupedia on Twitter](http://twitter.com/philopedia/) |
--- |
[Philippe Gamache](https://ph-il.ca/) |
[Gnome Archivist](https://gnomearchiviste.ca/) |

## VERSION

* Latest version now using zsh (default in MacOS) instead of bash


## Thanks to…

* [Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
    for the base code and readme. Look at all his own thanks.
* [Paul Irish](https://paulirish.com) and his [dotfiles repository](https://github.com/paulirish/dotfiles)
* [Artem Sapegin](https:/sapegin.me) and his [dotfiles repository](https://github.com/sapegin/dotfiles)
* [Jean-Christophe Lauffer](https://github.com/jclauffer) for lots of the code in my original .function and .profile
* [Damien Seguy](http://exakat.io) for the [Exakat config](https://github.com/dseguy)

???
https://github.com/paulmillr/dotfiles
https://github.com/holman/dotfiles
