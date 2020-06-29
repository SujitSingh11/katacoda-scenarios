# RBAC

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

## copy kubectl
`cp /usr/bin/kubectl .`{{execute HOST1}}

## Run a python3 http server
`python3 -m http.server`{{execute T2}}
