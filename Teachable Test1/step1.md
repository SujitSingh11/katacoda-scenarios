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

#### Copy the kubeadm Join code and paste it in HOST 2

`kubectl get nodes`{{execute HOST1}}

### Run this after you completed the above step

```
cat> web-service.yaml<<EOF
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

`kubectl apply -f api.yaml`{{execute HOST1}}

`kubectl apply -f api-service.yaml`{{execute HOST1}}

`kubectl apply -f webapp.yaml`{{execute HOST1}}

`kubectl apply -f webapp-service.yaml`{{execute HOST1}}

`kubectl apply -f malicious.yaml`{{execute HOST1}}

`kubectl get pods`{{execute HOST1}}

# Helper Functionality

Link https://[[HOST1_SUBDOMAIN]]-80-[[KATACODA_HOST1]].environments.katacoda.com
Link https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST2]].environments.katacoda.com