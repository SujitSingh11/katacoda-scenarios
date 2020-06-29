#!/bin/bash

cat> webapp-service.yaml<<EOF
apiVersion: v1
kind: Service
metadata:
  name: web-lb
spec:
  type: NodePort
  externalIPs:
    - [[HOST_IP]]
    - [[HOST2_IP]]
  ports:
    - port: 80
      protocol: TCP
      targetPort: 80
  selector:
    app: webapp
EOF

ip="$(ifconfig | grep -A 1 'ens3' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"

kubeadm init --apiserver-advertise-address=$id --pod-network-cidr=10.244.0.0/16

sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl apply -f /opt/weave-kube
kubectl get pod -n kube-system
kubeadm token list

join = kubeadm token create --print-join-command

echo "$join"

echo "$join" >> host2.sh

sleep 5

kubectl apply -f api.yaml
kubectl apply -f api-service.yaml
kubectl apply -f webapp.yaml
kubectl apply -f webapp-service.yaml
kubectl apply -f malicious.yaml




