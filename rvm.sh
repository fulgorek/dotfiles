#!/usr/bin/env bash

install_gem() {
  gem list -i $1 &> /dev/null
  if [[ $? -eq 1 ]]; then
    echo "Installing $1 gem..."
    gem install $1 &> /dev/null
  else
    echo "Gem $1 already installed!"
  fi
}

echo "Installing RVM..."
type rvm &> /dev/null
if [[ $? -ne 0 ]]; then
  {
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    if [[ $? -ne 0 ]]; then
      gpg --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    fi
    \curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles stable --ruby
  } &> /dev/null
fi

source ~/.rvm/scripts/rvm

[[ ! -f ~/.profile ]] && touch ~/.profile
cat ~/.profile | grep "source ~/.rvm/scripts/rvm" &> /dev/null
[[ $? -eq 1 ]] && echo "source ~/.rvm/scripts/rvm" >> ~/.profile

cat ~/.gemrc | grep "gem: --no-rdoc --no-ri" &> /dev/null
[[ $? -eq 1 ]] && echo "gem: --no-rdoc --no-ri" > ~/.gemrc

echo "Bundling default gems..."
install_gem "lolcat"
install_gem "itamae"
