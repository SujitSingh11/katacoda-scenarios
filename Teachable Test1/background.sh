#!/bin/bash
apt install net-tools
apt-get update
ifconfig
apt install docker.io -y
systemctl enable docker
apt install curl -y
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt -y update
apt install -y kubeadm kubectl kubelet kubernetes-cni