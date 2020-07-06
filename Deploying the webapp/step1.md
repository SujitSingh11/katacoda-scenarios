# Setup your enviorment

Create a Kubernetes cluster using this command 

`kubeadm init --apiserver-advertise-address=[[HOST_IP]] --pod-network-cidr=10.244.0.0/16`{{execute HOST1}}

After the cluster is up and running we need to copy and export the Kubeconfig admin.conf as a ENV variable, execute the below code to do the same.
```
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
```{{execute HOST1}}

Now let's apply the flannel networking plugin using the command below
`kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml`{{execute HOST1}}

Check the tokens using this command
`kubeadm token list`{{execute HOST1}}

### Connect HOST2 to the cluster

Copy the kubeadm Join code and paste it in HOST 2
`kubeadm token create --print-join-command`{{execute HOST1}}

Check if the node is added
`kubectl get nodes`{{execute HOST1}}

We need to make sure the IP address in the webapp-services be the IP's of the HOST, execute the below code to overwrite the yaml file with the code below.
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

Execute the code below to check if the pods are all running, if this process takes more that 4-5 min to start reset the scenerio.
`kubectl get pods`{{execute HOST1}}

### To Remove malicious Pod for now 

`kubectl delete -f malicious.yaml`{{execute HOST1}}

# Links to Webapp

Link https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com