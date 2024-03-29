#!/usr/bin/env bash

# update
sudo apt-get -y update 

# node install:
sudo apt-get -y install npm -g
# update npm
sudo npm install npm -g
# download and install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.0/install.sh | bash

# Clone dot files
cd ~/ && \
git clone https://github.com/kwaledesign/dotfiles.git

# Vim Config

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# symlinks - .vimrc and bundle/
ln -s ./dotfiles/vim/.vimrc && \
ln -s ~/dotfiles/vim/.vim/bundle/* ~/.vim/bundle/
# git submodule command (from within ~/dotfiles/vim/.vim/bundle/)
cd dotfiles/vim/.vim/bundle/ && \
git submodule update --init && \
git submodule foreach git pull origin master && \
cd

# install zsh and ohmyzsh and make default shell https://www.centosblog.com/spice-up-your-centos-shell-part-1-zsh/  (use ‘vagrant’ for <username> )

apt-get -y install zsh
sudo usermod -s /bin/zsh vagrant

# install ohmyzsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# symlink .zshrc
mv .zshrc .zshrc.old && \
ln -s ~/dotfiles/zsh/.zshrc

# install vtop performance monitoring
sudo npm install -g vtop

# install vifm ("Vifm is an ncurses based file manager with vi like keybindings/modes/options/commands/configurationwhich also borrows some useful ideas from mutt. If you use viVifm gives you complete keyboard control over your files without having to learn a new set of commands.”) (http://software.opensuse.org/download.html?project=utilities&package=vifm)
sudo apt-get -y install vifm
# themes: https://github.com/vifm/vifm-colors (symlink from dotfiles dir/ )
ln -s ~/dotfiles/vifm/.vifmrc && \
ln -s ~/dotfiles/vifm/.vifm/colors

# TIG
# http://jonas.nitro.dk/tig/manual.html
# https://github.com/jonas/tig
sudo apt-get install tig

# ACK http://beyondgrep.com/documentation/
sudo apt-get install -y ack-grep

# install yeoman 
# (if you run into npm dependency issuessee: http://askubuntu.com/questions/562417/how-do-you-update-npm-to-the-latest-version )
# not installing, don't know why...
#sudo npm install -g yo --stable

# install caniuse npm package https://www.npmjs.com/package/caniuse-cmd
sudo npm install -g caniuse-cmd

# install bundler
sudo gem install bundler

# eslint
sudo npm install -g eslint

#csslint
sudo npm install -g csslint

# install make
sudo apt-get install make
