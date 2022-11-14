#!/bin/bash

echo "Beginning ${0}"
echo "Installing eksctl"
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
echo "eksctl version is: $(eksctl version)"

curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.7/2022-06-29/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin



sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

echo "Creating cluster"
CLUSTER_NAME=techdemo
REGION=eu-west-1
INSTANCESIZE=t2.micro
NUMOFNODES=2

$ clusterawsadm bootstrap iam create-cloudformation-stack --config eks-config.yaml --region $REGION

eksctl create cluster -n "$CLUSTERNAME" -r "$REGION" --nodegroup-name workers -t $INSTANCESIZE --nodes $NUMOFNODES --ssh-access 
eksctl create cluster --name $CLUSTER_NAME --region $REGION
echo "Created: eksctl-$CLUSTER_NAME-cluster"
echo "You can see all created resources here: https://console.aws.amazon.com/cloudformation "

echo "viewing cluster nodes"
kubectl get nodes -o wide

echo "Viewing Workloads on cluster"
kubectl get pods -A -o wide


