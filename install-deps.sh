#!/bin/bash

echo "Beginning ${0}"

echo "Installing Dependencies"

sudo apt-get update
sudo apt-get install git-all

sudo apt-get install -y ca-certificates curl
sudo apt-get install -y curl
sudo apt-get install -y apt-transport-https
sudo apt-get install -y awscli

configure_ssh.sh

