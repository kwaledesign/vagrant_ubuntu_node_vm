#!/usr/bin/env bash

# dev directory permissions
sudo chown vagrant /home/vagrant/dev
sudo chmod 777 -R /home/vagrant/dev

# create wormhole
sudo mkdir /home/vagrant/dev/wormhole

# Tell apt-get to expect no interactive input preventing it from trying to access stdin
export DEBIAN_FRONTEND=noninteractive

# clear apt-get cache
sudo apt-get clean

# apt-get
# update the local package index
sudo apt-get -y update
# upgrade apt-get
sudo apt-get -y upgrade

# install required libraries for gem installs
sudo apt-get -y install libxml2-dev

# install js runtime
sudo apt-get -y install epel-release
sudo apt-get -y install nodejs
sudo apt-get -y install npm

# rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
sudo \curl -sSL https://get.rvm.io | bash -s stable --ruby
curl -sSL https://get.rvm.io | bash -s $1
source /usr/local/rvm/scripts/rvm
rvm use --install $1
shift
if (( $# ))
then gem install $@
fi
rvm install '2.1.5'
rvm install '2.2.0'
sudo chmod 755 -R /usr/local/rvm
sudo chown vagrant -R /usr/local/rvm

# install vim
sudo apt-get -y install vim

# install git
sudo apt-get -y install git
# configure git colors
git config --global color.diff auto 
git config --global color.status auto

# change ownership of /tmp to avoid permission issues
sudo chown -R vagrant:vagrant /tmp


# git setup script
#su

#printf '#!/bin/sh\nname=""\nemail=""\necho ""\necho "****************************"\necho "         Git Config         "\necho "****************************"\necho ""\nread -p "Enter your name: " name\nread -p "Enter your email: " email\necho ""\n\ngit config --global user.name "$name"\ngit config --global user.email "$email"\nssh-keygen -t rsa -C "$email"\neval "$(ssh-agent -s)"\nssh-add ~/.ssh/id_rsa\necho ""\necho ""\ncat ~/.ssh/id_rsa.pub\necho ""\necho ""\n\n\necho "Copy your public key above and paste in Settings > SSH Keys on github.com"' > /home/vagrant/dev/git_setup.sh

