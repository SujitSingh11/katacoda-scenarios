#!/bin/bash

kubectl apply -f api.yaml
kubectl apply -f api-service.yaml
kubectl apply -f webapp.yaml
kubectl apply -f webapp-service.yaml
