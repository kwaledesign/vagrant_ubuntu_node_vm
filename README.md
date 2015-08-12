# A Vagrant, Ubuntu, Node Virtual Machine

Essentially a for of  [dkoloditch](https://github.com/dkoloditch)'s awesome
work on our work enviornments.

1. Download latest Ubuntu box (no guest additions flavor) from here: http://www.vagrantbox.es/  Most recent at time of this writting: [Official Ubuntu 14.10 daily Cloud Image amd64 (Development releaseNo Guest Additions)](https://cloud-images.ubuntu.com/vagrant/utopic/current/utopic-server-cloudimg-amd64-vagrant-disk1.box) Even if not most recent Ubuntu, it's easy to update OS after downloaded and installed.


2. Local Machine Environment Setup (your Mac)

Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html)

Clone this repo into your User directory (`/Users/<yourName>`). Then run the
osx Vagrant setup script (fork and adjust script as needed).

```
sh ~/vagrant_ubuntu_node_vm/vagrant_os_x_prep.sh
```

Open the VirtualBox app and delete all VMs and files.

3. Symlink Configuration files

```
cd ~/dev/vagrant_boxes/OpenSource && \
ln -s ~/vagrant_ubuntu_node_vm/Vagrantfile ~/dev/vagrant_boxes/OpenSource && \
ln -s ~/vagrant_ubuntu_node_vm/provision.sh ~/dev/vagrant_boxes/OpenSource
```

Also move the box you downloaded in step 1 to this same location (`~/dev/vagrant_boxes/OpenSource`) and add your new box

```
vagrant box add ubuntu-14.10 utopic-server-cloudimg-amd64-vagrant-disk1.box
 ```

4. Start and Provision Vagrant

```
vagrant up
```

5. Configuration

connect to your Vagrant machine

```
vagrant ssh
```

git setup, hit ENTER to use defaults and no passphrase

```
sh ~/dev/git_setup.sh
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
 
