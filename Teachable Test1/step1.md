# Setup your enviorment

### Check the IP adderss of both host

`sudo cp /etc/kubernetes/admin.conf $HOME/`{{execute}}

`sudo chown $(id -u):$(id -g) $HOME/admin.conf`{{execute}}

`export KUBECONFIG=$HOME/admin.conf`{{execute}}

`kubectl apply -f /opt/weave-kube`{{execute}}

`kubectl get pod -n kube-system`{{execute}}

`kubeadm token list`{{execute}}
