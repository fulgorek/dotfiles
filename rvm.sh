#!/usr/bin/env bash

echo "Installing RVM..."
type rvm &> /dev/null
if [[ $? -ne 0 ]]; then
  {
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    if [[ $? -ne 0 ]]; then
      gpg --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    fi
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
    source ~/.profile
  } &> /dev/null
fi

echo "gem: --no-rdoc --no-ri" > ~/.gemrc
echo "Bundling default gems..."
{
  gem install lolcat
  gem install itamae
} &> /dev/null
