#!/bin/bash

sudo mysql.server stop

if [ ! -d !/dev ]
then
	mkdir ~/dev
	mkdir ~/dev/vagrant_boxes
	mkdir ~/dev/vagrant_boxes/OpenSource
	mkdir ~/dev/vagrant_boxes/wormhole
	mkdir ~/dev/vagrant_share
else
	cd ~/dev/vagrant_boxes/OpenSource
	vagrant halt
	vagrant box remove utopic-server-cloudimg-amd64-vagrant-disk1.box
	rm -fr .vagrant/ Vagrantfile provision.sh utopic-server-cloudimg-amd64-vagrant-disk1.box
fi

vagrant plugin install vagrant-vbguest

ssh-keygen -R 172.28.128.1
ssh-keygen -R 172.28.128.3
ssh-keygen -R 127.0.0.1
ssh-keygen -R [127.0.0.1]
ssh-keygen -R [127.0.0.1]:2222
ssh-keygen -R 10.0.2.1
ssh-keygen -R 10.0.2.15
