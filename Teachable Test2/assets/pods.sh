#!/bin/bash

sleep 2

kubectl apply -f /opt/weave-kube
kubectl get pod -n kube-system
kubeadm token list

kubectl apply -f api.yaml
kubectl apply -f api-service.yaml
kubectl apply -f webapp.yaml
kubectl apply -f webapp-service.yaml
kubectl apply -f malicious.yaml

