## Cluster Role Binding

Now to cluster role binding

### Create a Cluster Service

Similar to the role binding we will create a service account.
`kubectl apply -f service2.yaml`{{execute HOST1}}

Check if service account is created
`kubectl get sa`{{execute HOST1}}
### Create Cluster Role

This will create a cluster role for the service account we created above.
`kubectl apply -f clusterrole.yaml`{{execute HOST1}}

Check if cluster role has been created
`kubectl get clusterrole | grep 'rbac'`{{execute HOST1}}

### Apply cluster role binding

This will create cluster role binding for the service account
`kubectl apply -f clusterrole-binding.yaml`{{execute HOST1}}

Check if cluster role binding has been created
`kubectl get clusterrolebinding | grep 'rbac'`{{execute HOST1}}

### Now deploye a new pod and assign the newly created service account to it
`kubectl apply -f apiv2.yaml`{{execute HOST1}}

### Check the created pod

NOTE THE POD NAME
`kubectl get pods`{{execute HOST1}}

## Open shell in the pod

Make sure to copy the above printed pod name rbac-test and replace the pod name below
`kubectl exec -it <Pod Name> /bin/sh`{{copy}}

## Download kubectl in the pod

Download the kubectl from the Host machine
`wget [[HOST_IP]]:8000/kubectl`{{execute HOST1}}

## Change permission on the kubectl file

`chmod +x kubectl`{{execute HOST1}}

## Get pods using kubectl

`./kubectl get pods`{{execute HOST1}}

## Get pods of default namespace
This will list pods from the default namespace
`./kubectl get pods --namespace default`{{execute HOST1}}

## Get pods of rbac namespace
This will return no resourse cause no pods are running in the namespace, we are authorize to list pods from any namespcae.
`./kubectl get pods --namespace rbac-ns`{{execute HOST1}}

## Get services using kubectl (should be a error)
This should result in error cause we are not authroized to access the services.
`./kubectl get services`{{execute HOST1}}

## Exit from the pod

To exit the POD shell execute the below code
`exit`{{execute HOST1}}
