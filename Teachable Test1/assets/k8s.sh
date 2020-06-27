#!/bin/bash

ip="$(ifconfig | grep -A 1 'ens3' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"

kubeadm init --apiserver-advertise-address=$ip --pod-network-cidr=10.244.0.0/16

echo "Done Run the next command from the panel"

cat> webapp-service.yaml


