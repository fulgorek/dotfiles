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
brew install awscli
brew install az
brew install ack
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install pv
brew install rename
brew install ssh-copy-id
brew install tfenv
brew install docker
brew install docker-compose
brew install elixir
brew install erlang
brew install ffmpeg
brew install fish
brew install git
brew install git-crypt
brew install go
brew install grep
brew install htop
brew install httpie
brew install lame
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

brew cask install google-chrome
brew cask install firefox
brew cask install spectacle
brew cask install docker
brew cask install virtualbox
brew cask install vagrant
brew cask install iterm2
brew cask install sublime-text
brew cask install sequel-pro
brew cask install slack
brew cask install tunnelblick
brew cask install caffeine
brew cask install flux
brew cask install evernote
brew cask install dropbox
brew cask install skype

# Remove outdated versions from the cellar.
brew cleanup
