#!/bin/bash
kubeadm init --apiserver-advertise-address=<IP Address> --pod-network-cidr=10.244.0.0/16
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl apply -f /opt/weave-kube
kubectl get pod -n kube-system
kubeadm token list
