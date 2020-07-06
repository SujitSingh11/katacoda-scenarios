## create a namespace

The command below will create a new namespace called "rbac-ns"
`kubectl create namespace rbac-ns`{{execute HOST1}}

## Apply service.yaml

Apply the service account running in the newly created namespace
`kubectl apply -f service.yaml`{{execute HOST1}}

## Verify namespace

Check if the service account is created in the created namespace using the command below
`kubectl get sa --namespace rbac-ns`{{execute HOST1}}

## Create role

Create a role in the rbac-ns namespace
`kubectl apply -f role.yaml`{{execute HOST1}}

## Check role in namespace rbac-ns

Check if the role has been create in the namespace
`kubectl get role --namespace rbac-ns`{{execute HOST1}}

## Creating a role binding
`kubectl apply -f rbac-rolebinding.yaml`{{execute HOST1}}

## Check role in namespace rbac-ns

Below code will get the rolebindings in namespace rbac-ns
`kubectl get rolebinding --namespace rbac-ns`{{execute HOST1}}

## Create a deployment in rbac-ns namespace
`kubectl apply -f api-ns.yaml`{{execute HOST1}}

## copy kubectl

Copy the kubectl to the current working directory
`cp /usr/bin/kubectl .`{{execute HOST1}}

## Open new terminal

Now we need to open a http server in a new tab. You can open a new terminal by clicking on the plus sign or execute the below code to open one.
`echo "Run in T2"`{{execute T3}}

## Run a python3 http server

To run a python3 server execute the below code
`python3 -m http.server`{{execute T2}}

## Get pods in namespace rbac-ns

Now back to the first tab. This will list the pods in the namespace rbac-ns 
NOTE THE POD NAME
`kubectl get pods --namespace rbac-ns`{{execute HOST1}}

## Open shell in the pod

This will open a shell in the pod, make sure you replace the pod name in the below code
`kubectl exec -it <Pod Name> sh --namespace rbac-ns`{{copy}}

## Download kubectl in the pod

Download the kubectl from the Master working directory 
`wget [[HOST_IP]]:8000/kubectl`{{execute HOST1}}

## Change permission on the kubectl file

`chmod +x kubectl`{{execute HOST1}}

## Get pods using kubectl
`./kubectl get pods`{{execute HOST1}}

## Get services using kubectl 

The below code will should cause a error cause it dose not have the permission to list services
`./kubectl get services`{{execute HOST1}}

## Exit from the pod

To exit from the app shell execute the below code
`exit`{{execute HOST1}}
