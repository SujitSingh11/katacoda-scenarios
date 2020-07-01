# Setup your enviorment

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

### Misconfig

`kubectl create clusterrolebinding encdecservice --clusterrole cluster-admin --serviceaccount=default:default`{{execute HOST1}}

## Define Services

`bash service.sh`{{execute HOST1}}

## Configure our webapp

`bash pods.sh`{{execute HOST1}}
