#!/bin/bash

ip="$(ifconfig | grep -A 1 'ens3' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"

kubeadm init --apiserver-advertise-address=$id --pod-network-cidr=10.244.0.0/16

cp /etc/kubernetes/admin.conf $HOME/
chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

sleep 2

kubectl apply -f /opt/weave-kube
kubectl get pod -n kube-system
kubeadm token list

kubectl apply -f api.yaml
kubectl apply -f api-service.yaml
kubectl apply -f webapp.yaml
kubectl apply -f webapp-service.yaml
kubectl apply -f malicious.yaml

echo "Join the cluster at with this"
kubeadm token create --print-join-command




