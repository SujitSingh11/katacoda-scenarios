## Join the network on the host

Now let the HOST2 join the network, the below code will print out the join code just copy paste the output of this command in HOST2
`kubeadm token create --print-join-command`{{execute HOST1}}

Check if the node has joined the cluster
`kubectl get nodes`{{execute HOST1}}

## Check Running Pods

You can execute this code multiple times, just make sure all the pods are up and running.
If it takes longer than 5 min just reset the scenerio
`kubectl get pods`{{execute HOST1}}

## Link to the webapp
Link https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]
