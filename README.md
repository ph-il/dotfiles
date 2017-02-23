# Ph-il’s (Philoupedia) dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/ph-il/dotfiles.git && cd dotfiles && source bootstrap.sh
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
##### PROJECTS ALIAS #####
 
# goto a specific project
alias gotest='gosf $PRJ_DIR/test/formation2 55 sf2'
alias godf='gosf $PRJ_DIR/dotfiles/ none none' 

##### ALIAS #####

##### CONFIG #####
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Philippe Gamache"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="philippe@ph-il.ca"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults and Applications:


```bash
./install.sh
./brew_install.sh
./bootstrap.sh
./npm_install.sh
./app_config.sh
./kuzzle_install.sh
./exakat_install.sh
./maxos.sh
brew bundle -v --file=Fontfile
```

## Updates

### Update Tools 

This will updates all tools and Mac Application already installed.

* Execute:
```sh
update
```

### Update sensible macOS defaults

```bash
./macos.sh
```

### Update and Add new applications in this dotfiles

```bash
./update.sh
```


### Update bootstrap script and dotfiles

To update, `cd` into your local `dotfiles` repository and then:

```bash
./bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; ./bootstrap.sh
```

### Add new applications added in Brewfile 

When some application need to be add, put it in the Brewfile, save in your git, then run:

```bash
source update.sh
```

## Testing

### Test PHP 5.5

* Execute
```sh
$(brew --prefix homebrew/php/php55)/bin/php -i "(command-line 'phpinfo()')"
```
* Make sure that everyting is working

### Test PHP 5.6

* Execute
```sh
$(brew --prefix homebrew/php/php56)/bin/php -i "(command-line 'phpinfo()')"
```

* Make sure that everyting is working


### Test PHP 7.0

* Execute
```sh
$(brew --prefix homebrew/php/php70)/bin/php -i "(command-line 'phpinfo()')"
```

* Make sure that everyting is working

### Test PHP 7.1

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
goexakat
exakat doctor
```

## Some usefull commands

### Setup Hosts

* To update your .hosts file, execute:
```sh
cfghosts
```

### Setup PHP

* To update your php config files, execute:
```sh
cfgphp
```

### Setup Apache

* To update your apache config files, execute:
```sh
cfgapache
```

### Start PHP Server

* Execute:
```sh
phpserver
```

### Switch PHP Version

Switch between PHP version 55, 56, 70, 71

* Execute:
```sh
sphp version
```

## Feedback

Suggestions/improvements
[welcome](https://github.com/ph-il/dotfiles/issues)!

## Author

[Follow @philoupedia on Twitter](http://twitter.com/philopedia/) |
--- |
[Philippe Gamache](https://ph-il.ca/) |
[Gnome Archivist](https://gnomearchiviste.ca/) |

## Thanks to…

* [Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles) for the base code and readme. All is thanks are also imprtant:  
  * @ptb and [his _OS X Lion Setup_ repository](https://github.com/ptb/Mac-OS-X-Lion-Setup)
  * [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
  * [Chris Gerke](http://www.randomsquared.com/) and his [tutorial on creating an OS X SOE master image](http://chris-gerke.blogspot.com/2012/04/mac-osx-soe-master-image-day-7.html) + [_Insta_ repository](https://github.com/cgerke/Insta)
  * [Cătălin Mariș](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
  * [Gianni Chiappetta](http://gf3.ca/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
  * [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
  * [Lauri ‘Lri’ Ranta](http://lri.me/) for sharing [loads of hidden preferences](http://osxnotes.net/defaults.html)
  * [Matijs Brinkhuis](http://hotfusion.nl/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
  * [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
  * [Sindre Sorhus](http://sindresorhus.com/)
  * [Tom Ryder](https://sanctum.geek.nz/) and his [dotfiles repository](https://sanctum.geek.nz/cgit/dotfiles.git/about)
  * [Kevin Suttle](http://kevinsuttle.com/) and his [dotfiles repository](https://github.com/kevinSuttle/dotfiles) and [OSXDefaults project](https://github.com/kevinSuttle/OSXDefaults), which aims to provide better documentation for [`~/.macos`](https://mths.be/macos)
  * [Haralan Dobrev](http://hkdobrev.com/)
  * anyone who [contributed a patch](https://github.com/mathiasbynens/dotfiles/contributors) or [made a helpful suggestion](https://github.com/mathiasbynens/dotfiles/issues)
* [Paul Irish](http://paulirish.com) and his [dotfiles repository](https://github.com/paulirish/dotfiles)
* [Jean-Christophe Lauffer](https://github.com/jclauffer) for lot of code in my original .profile
* [Damien Seguy](http://exakat.io) for the [Exakat config](https://github.com/dseguy)

