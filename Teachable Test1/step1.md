# Setup your enviorment

`bash k8s.sh`{{execute HOST1}}

Click on this 

```
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

```{{execute}}




```
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl apply -f /opt/weave-kube
kubectl get pod -n kube-system
kubeadm token list
```{{execute interrupt}}

```
kubectl apply -f api.yaml
kubectl apply -f api-service.yaml
kubectl apply -f webapp.yaml
kubectl apply -f webapp-service.yaml
kubectl apply -f m.yaml
```{{execute }}

# Helper Functionality

Link https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com