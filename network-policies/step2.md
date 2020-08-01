
## Apply the Network policie
To secure our deployment we will apply this policie that will block access to the api service, to do the same execute the below code

`kubectl apply -f network-policy.yaml`{{execute HOST1}}

Now our deployment is secure