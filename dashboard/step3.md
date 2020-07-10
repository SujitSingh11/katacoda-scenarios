## Compormise cluster

Now as shown in the video lets compormise the cluster from the dashboard

1. Now lets add our malicious file into the cluster, press ADD sign button in the navbar
2. Copy and Paste the output of below code in the dashboard
`cat malicious.yaml`{{execute HOST1}}
3. Press Upload
4. Now click on 3 dots and click on exec on the newly created attacker Pod
5. Lets check if the we can access the directory `ls /attacker/etc/shadow`{{copy}}
6. To check the content of the shadow file `cat /attacker/etc/shadow`{{copy}}

As we can see we have access to the cluster and force run pods from here

## TESTING - TO RUN WEBAPPS
`bash pods.sh`{{execute HOST1}}

`kubectl get pods`{{execute HOST1}}