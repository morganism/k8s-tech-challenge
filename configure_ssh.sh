#!/bin/bash

echo "Beginning ${0}"

cd $HOME
ssh-keygen -f git_rsa  
mkdir -p .ssh
mv git_rsa* .ssh/
chmod 700 .ssh
chmod 644 .ssh/git_rsa.pub
chmod 600 .ssh/git_rsa
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
cat .ssh/git_rsa.pub >> .ssh/authorized_keys
eval $(ssh-agent -s)
ssh-add ~/.ssh/
