#!/bin/bash

kubectl apply -f kube-flannel.yml
kubectl apply -f api.yaml
kubectl apply -f api-service.yaml
kubectl apply -f webapp.yaml
kubectl apply -f webapp-service.yaml
# kubectl apply -f malicious.yaml