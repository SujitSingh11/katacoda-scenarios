#!/bin/bash
kubeadm init --apiserver-advertise-address=[[HOST_IP]] --pod-network-cidr=10.244.0.0/16

cat> webapp-service.yaml


