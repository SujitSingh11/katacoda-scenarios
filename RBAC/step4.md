## Cluster Role Binding

### Create a Cluster Service

`kubectl apply -f service2.yaml`{{execute HOST1}}

### Create Cluster Role

`kubectl apply -f clusterrole.yaml`{{execute HOST1}}

### Check if service account is created

`kubectl get sa`{{execute HOST1}}

### Check if cluster role has been created

`kubectl get clusterrole | grep 'rbac'`{{execute HOST1}}

### Apply cluster role binding

`kubectl apply -f clusterrole-binding.yaml`{{execute HOST1}}

### Check if cluster role binding has been created

`kubectl get clusterrolebinding | grep 'rbac'`{{execute HOST1}}

### Now deploye a new pod and assign the newly created service account to it

`kubectl apply -f apiv2.yaml`{{execute HOST1}}

### Check the created pod

`kubectl get pods`{{execute HOST1}}

## Open shell in the pod

`kubectl exec -it <Pod Name> /bin/sh`{{copy}}

## Download kubectl in the pod

`wget [[HOST_IP]]:8000/kubectl`{{execute HOST1}}

## Change permission on the kubectl file

`chmod +x kubectl`{{execute HOST1}}

## Get pods using kubectl

`./kubectl get pods`{{execute HOST1}}

## Get pods of default namespace

`./kubectl get pods`{{execute HOST1}}

## Get pods of rbac namespace

`./kubectl get pods`{{execute HOST1}}

## Get services using kubectl (should be a error)

`./kubectl get services`{{execute HOST1}}

## Exit from the pod

`exit`{{execute HOST1}}
