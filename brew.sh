#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
brew install pv
brew install rename
brew install ssh-copy-id
# brew install tree
# brew install vbindiff
# brew install zopfli

# brew install ansible
# brew install aws-elasticbeanstalk
brew install caddy
brew install tfenv
brew install docker
brew install docker-compose
# brew install docker-machine
brew install elixir
brew install erlang
brew install ffmpeg
brew install fish
# brew install git
brew install git-crypt
# brew install glib
brew install go
brew install grep
brew install htop
brew install httpie
# brew install hugo
# brew install imagemagick
brew install lame
# brew install mysql
brew install ncdu
brew install nmap
brew install python
brew install speedtest_cli
brew install sqlite
brew install tmate
brew install tmux
brew install tree
brew install vim
brew install wget
brew install youtube-dl
brew install zsh


# Remove outdated versions from the cellar.
brew cleanup
