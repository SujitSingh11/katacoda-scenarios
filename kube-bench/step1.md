# Setup your enviorment

As we did in previous scenerios we have to setup the cluster, run the below code to configure the cluster.
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

## Configure our webapp

After the above code executed run this command to run our webapp and API server
`bash pods.sh`{{execute HOST1}}

## Join the network on the host

Now let the HOST2 join the network, the below code will print out the join code just copy paste the output of this command in HOST2
`kubeadm token create --print-join-command`{{execute HOST1}}

Check if the node has joined the cluster
`kubectl get nodes`{{execute HOST1}}

## Check Running Pods

You can execute this code multiple times, just make sure all the pods are up and running.
If it takes longer than 5 min just reset the scenerio
`kubectl get pods`{{execute HOST1}}

## Link to the webapp
Link https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]

## Add misconfiguration
We have to reconfigure the misconfiguration we added in the previous videos, for that execute the below code

```
cp -f kube-apiserver.yaml /etc/kubernetes/manifests/kube-apiserver.yaml
cp -f config.yaml /var/lib/kubelet/config.yaml
```{{execute HOST1}}

To see the content of the file execute the below code

`sudo cat /etc/kubernetes/manifests/kube-apiserver.yaml`{{execute HOST1}}

`sudo cat /var/lib/kubelet/config.yaml`{{execute HOST1}}
