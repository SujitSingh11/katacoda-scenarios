## Configure and Deploy Dashboard

The below code will is a breakdown of the dashboard yaml file, we have configured this with the external IPs

```
cat> dashboard-service.yaml<<EOF
kind: Service
apiVersion: v1
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
spec:
  type: NodePort
  externalIPs:
    - [[HOST_IP]]
    - [[HOST2_IP]]
  ports:
    - port: 443
      targetPort: 8443
  selector:
    k8s-app: kubernetes-dashboard
EOF
```{{execute HOST1}}

As the dashboard yaml file is quite large we have done the configuring for you just execute the below code to deploy the dashboard

`kubectl apply -f dashboard.yaml`{{execute HOST1}}

`kubectl apply -f dashboard-service.yaml`{{execute HOST1}}

## Check Running Pods in kube system

You can execute this code multiple times, just make sure all the pods are up and running.
If it takes longer than 5 min just reset the scenerio

`kubectl get pod -n kube-system`{{execute HOST1}}

## Create a Cluster role binding

Currently we cannot see anything on the dashboard because we haven't created any Service account
Lets do it right now by executing the below code
`kubectl create clusterrolebinding dashboard-test --clusterrole cluster-admin --serviceaccount=kubernetes-dashboard:kubernetes-dashboard`{{execute HOST1}}

## Link to the dashboard

Link https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]