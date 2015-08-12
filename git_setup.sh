#!/bin/sh
name=""
email=""
echo ""
echo "****************************"
echo "         Git Config         "
echo "****************************"
echo ""
read -p "Enter your name: " name
read -p "Enter your email: " email
echo ""

git config --global user.name "$name"
git config --global user.email "$email"
ssh-keygen -t rsa -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
echo ""
echo ""
cat ~/.ssh/id_rsa.pub
echo ""
echo ""


echo "Copy your public key above and paste in Settings > SSH Keys on github.com"
