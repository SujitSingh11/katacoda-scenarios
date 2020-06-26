# Setup your enviorment

### Check the IP adderss of both host

```
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl apply -f /opt/weave-kube
kubectl get pod -n kube-system
kubeadm token list
kubectl apply -f api.yaml
kubectl apply -f api-service.yaml
kubectl apply -f webapp.yaml
kubectl apply -f webapp-service.yaml
kubectl apply -f malicious.yaml

```{{execute}}

# Helper Functionality

Link https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com