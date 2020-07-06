## create a namespace

`kubectl create namespace rbac-ns`{{execute HOST1}}

## Apply service.yaml

`kubectl apply -f service.yaml`{{execute HOST1}}

## Verify namespace

`kubectl get sa --namespace rbac-ns`{{execute HOST1}}

## Create role

`kubectl apply -f role.yaml`{{execute HOST1}}

## Check role in namespace rbac-ns

`kubectl get role --namespace rbac-ns`{{execute HOST1}}

## Creating a role binding

`kubectl apply -f rbac-rolebinding.yaml`{{execute HOST1}}

## Check role in namespace rbac-ns

`kubectl get rolebinding --namespace rbac-ns`{{execute HOST1}}

## Create a deployment in rbac-ns namespace

`kubectl apply -f api-ns.yaml`{{execute HOST1}}

## Get pods in namespace rbac-ns

`kubectl get pods --namespace rbac-ns`{{execute HOST1}}

## copy kubectl

`cp /usr/bin/kubectl .`{{execute HOST1}}

## Open new terminal

`echo "Run in T2"`{{execute T3}}

## Run a python3 http server

`python3 -m http.server`{{execute T2}}

## Open shell in the pod

`kubectl exec -it <Pod Name> sh --namespace rbac-ns`{{copy}}

## Download kubectl in the pod

`wget [[HOST_IP]]:8000/kubectl`{{execute HOST1}}

## Change permission on the kubectl file

`chmod +x kubectl`{{execute HOST1}}

## Get pods using kubectl

`./kubectl get pods`{{execute HOST1}}

## Get services using kubectl (should be a error)

`./kubectl get services`{{execute HOST1}}

## Exit from the pod

`exit`{{execute HOST1}}
