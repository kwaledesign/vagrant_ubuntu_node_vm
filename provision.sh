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

# install js runtime
sudo apt-get -y install epel-release
sudo apt-get -y install nodejs
sudo apt-get -y install npm

# install vim
sudo apt-get -y install vim

# install git
sudo apt-get -y install git
# configure git colors
git config --global color.diff auto 
git config --global color.status auto

# change ownership of /tmp to avoid permission issues
# sudo chown -R vagrant:vagrant /tmp
