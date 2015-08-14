# A Vagrant, Ubuntu, Node Virtual Machine

Essentially a fork of  [dkoloditch](https://github.com/dkoloditch)'s awesome
(closed source) work on our work enviornments.

### 1. Local Machine Environment Setup (your Mac)

Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) if you don't already have them.

Ensure mysql isn't running
```
sudo mysql.server stop
```
	
If this is your first install, create the following directories:
```
  mkdir ~/dev
	mkdir ~/dev/vagrant_boxes
	mkdir ~/dev/vagrant_boxes/OpenSource
	mkdir ~/dev/vagrant_share
```

If this is a subsequent install, clean up previous installation
```
	cd ~/dev/vagrant_boxes/OpenSource
	vagrant halt
	vagrant box remove utopic-server-cloudimg-amd64-vagrant-disk1.box
	rm -fr .vagrant/ Vagrantfile provision.sh utopic-server-cloudimg-amd64-vagrant-disk1.box
```
~~(This should delete all previous vm's but, open the VirtualBox app and be
sure)~~

Regardless if first or subsequent install, run the following
```
  vagrant plugin install vagrant-vbguest

  ssh-keygen -R 172.28.128.1
  ssh-keygen -R 172.28.128.3
  ssh-keygen -R 127.0.0.1
  ssh-keygen -R [127.0.0.1]
  ssh-keygen -R [127.0.0.1]:2222
  ssh-keygen -R 10.0.2.1
  ssh-keygen -R 10.0.2.15
```

### 2. Download latest Ubuntu box

```
  cd ~/dev/vagrant_boxes/OpenSource
  vagrant box add ubuntu/trusty64 --force
```

### 3. Clone and Symlink Configuration files

```
  cd && \
  git clone git@github.com:kwaledesign/vagrant_ubuntu_node_vm.git && \
  cd ~/dev/vagrant_boxes/OpenSource && \
  ln -s ~/vagrant_ubuntu_node_vm/Vagrantfile ~/dev/vagrant_boxes/OpenSource && \
  ln -s ~/vagrant_ubuntu_node_vm/provision.sh ~/dev/vagrant_boxes/OpenSource
```

### 4. Start and Provision Vagrant

```
  vagrant up
```

### 5. Configuration

connect to your Vagrant machine

```
  vagrant ssh
```

git setup, (hit ENTER to use defaults and no passphrase)

```
  sh ~/vagrant_ubuntu_node_vm/git_setup.sh ????
```

verify and complete the setup (IMPORTANT)

```
ssh -T git@github.com
```

permissions fix for dev/ directory

```
sudo chown vagrant:vagrant -R ~/dev/
```

6. Final Enviornment Configuration

```
sh ~/vagrant_ubuntu_node_vm/provisionEnviornment.sh 
```
 
