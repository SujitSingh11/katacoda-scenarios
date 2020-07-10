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
  externalIps:
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