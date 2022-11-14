#!/bin/bash

echo "Deleting cluster"
eksctl delete cluster --name my-cluster --region region-code
