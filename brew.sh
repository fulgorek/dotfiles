#!/usr/bin/env bash

sudo -v

brew_package() {
  brew list $1 &> /dev/null
  if [[ $? -eq 1 ]]; then
  	echo "Installing $1"
  	brew install $1 &> /dev/null
  else
  	echo "$1 already installed!"
  fi
}

type brew &> /dev/null
if [[ $? -ne 0 ]]; then
  echo "installing brew"
  /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
fi

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update &> /dev/null

# Upgrade any already-installed formulae.
brew upgrade &> /dev/null

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew_package "coreutils"

# Install some other useful utilities like `sponge`.
brew_package "moreutils"
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew_package "findutils"
# Install GNU `sed`, overwriting the built-in `sed`.
brew_package "gnu-sed --with-default-names"
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew_package "bash"
brew_package "bash-completion2"

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew_package "wget --with-iri"

# Install GnuPG to enable PGP-signing commits.
brew_package "gnupg"

# Install more recent versions of some macOS tools.
brew_package "vim --with-override-system-vi"
brew_package "grep"
brew_package "openssh"
brew_package "screen"

# Install font tools.
brew tap bramstein/webfonttools
brew_package "sfnt2woff"
brew_package "sfnt2woff-zopfli"
brew_package "woff2"

# Install other useful binaries.
brew_package "awscli"
brew_package "az"
brew_package "ack"
brew_package "git"
brew_package "git-lfs"
brew_package "imagemagick --with-webp"
brew_package "rename"
brew_package "ssh-copy-id"
brew_package "tfenv"
brew_package "nvm"
brew_package "docker-compose"
brew_package "elixir"
brew_package "erlang"
brew_package "fish"
brew_package "git"
brew_package "go"
brew_package "grep"
brew_package "htop"
brew_package "httpie"
brew_package "lame"
brew_package "ncdu"
brew_package "nmap"
brew_package "python"
brew_package "speedtest_cli"
brew_package "sqlite"
brew_package "tmate"
brew_package "tmux"
brew_package "tree"
brew_package "vim"
brew_package "wget"
brew_package "youtube-dl"
brew_package "fisher"

brew cask install google-chrome
brew cask install firefox
brew cask install opera
brew cask install spectacle
brew cask install docker
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
brew cask install mac2imgur

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
