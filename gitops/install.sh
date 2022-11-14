#!/bin/bash

echo "Beginning ${0}"
echo "install flux"
curl -s https://fluxcd.io/install.sh | sudo bash

echo "installing bash compleations"
. <(flux completion bash)

echo "Bootstrapping Github"

flux bootstrap git \
  --url=ssh://git@github.com/morganism/k8s-tech-challenge> \
  --branch=default \
  --path=clusters/techdemo \
  --private-key-file=$HOME/.ssh/rsa_demo








curl --silent --location "https://github.com/weaveworks/weave-gitops/releases/download/v0.10.1/gitops-$(uname)-$(uname -m).tar.gz" | tar xz -C /tmp
sudo mv /tmp/gitops /usr/local/bin
gitops version



