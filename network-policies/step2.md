
## Apply Calico plugin

Now let's apply the calico networking plugin using the command below, the calico yaml file is already setup with the necessary changes.

`kubectl apply -f calico.yaml`{{execute HOST1}}

## Apply the Network policie
To secure our deployment we will apply this policie that will block access to the api service, to do the same execute the below code

`kubectl apply -f network-policy.yaml`{{execute HOST1}}

To check if deployed

`kubectl get pods`{{execute HOST1}}

Now our deployment is secure