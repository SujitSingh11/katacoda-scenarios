#!/bin/bash

kubectl apply -f /opt/weave-kube
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f api.yaml
kubectl apply -f api-service.yaml
kubectl apply -f webapp.yaml
kubectl apply -f webapp-service.yaml
