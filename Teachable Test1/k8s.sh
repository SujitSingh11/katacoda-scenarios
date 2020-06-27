#!/bin/bash

ip="$(ifconfig | grep -A 1 'ens3' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"

kubeadm init --apiserver-advertise-address=$ip --pod-network-cidr=10.244.0.0/16

sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl apply -f /opt/weave-kube
kubectl get pod -n kube-system
kubeadm token list

cat> webapp-service.yaml
>apiVersion: v1
>kind: Service
>metadata:
>  name: web-lb
>spec:
>  type: NodePort
>  externalIPs:
>    - $ip
>  ports:
>    - port: 80
>      protocol: TCP
>      targetPort: 80
>  selector:
>    app: webapp

