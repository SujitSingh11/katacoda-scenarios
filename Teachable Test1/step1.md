# Setup your enviorment

`kubeadm init --apiserver-advertise-address=[[HOST_IP]] --pod-network-cidr=10.244.0.0/16`{{execute HOST1}}

```
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl apply -f /opt/weave-kube
kubectl get pod -n kube-system
kubeadm token list
```{{execute HOST1}}

### Copy the kubeadm Join code and paste it in HOST 2

`kubeadm token create --print-join-command`{{execute HOST1}}

### Check if the node is added

`kubectl get nodes`{{execute HOST1}}

### Add the IPs of both host in webapp-service.yaml

```
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
```{{execute HOST1}}

### Run the pods

`kubectl apply -f api.yaml`{{execute HOST1}}

`kubectl apply -f api-service.yaml`{{execute HOST1}}

`kubectl apply -f webapp.yaml`{{execute HOST1}}

`kubectl apply -f webapp-service.yaml`{{execute HOST1}}

`kubectl apply -f malicious.yaml`{{execute HOST1}}

### Check if the pods are Running

`kubectl get pods`{{execute HOST1}}

### To Remove malicious Pod for now 

`kubectl delete -f malicious.yaml`{{execute HOST1}}

# Links to Webapp

Link https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com
Link https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com