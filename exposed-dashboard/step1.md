# Setup your enviorment

First we need to configure the cluster as we had in the first lab, therefore we have put together the below code that will quickly get you started.
````
kubeadm init --apiserver-advertise-address=[[HOST_IP]] --pod-network-cidr=10.244.0.0/16

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

cp /etc/kubernetes/admin.conf $HOME/
chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
```{{execute HOST1}}

## Join the network on the host

Now let the HOST2 join the network, the below code will print out the join code just copy paste the output of this command in HOST2
`kubeadm token create --print-join-command`{{execute HOST1}}

Check if the node has joined the cluster
`kubectl get nodes`{{execute HOST1}}

