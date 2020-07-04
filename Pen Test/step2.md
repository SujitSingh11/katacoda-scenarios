# Join the network on the host

## Copy paste the output of this command in terminal below

`kubeadm token create --print-join-command`{{execute HOST1}}

## Run the webapp
```
kubectl apply -f api.yaml
kubectl apply -f api-service.yaml
kubectl apply -f webapp.yaml
kubectl apply -f webapp-service.yaml
```{{execute HOST1}}

## Check Running Pods (Use this links in place of IP Address for nmap)

`kubectl get pods`{{execute HOST1}}


Link https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]

Link https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]
