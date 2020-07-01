
kubectl create namespace rbac-ns
kubectl apply -f service.yaml
kubectl apply -f role.yaml
kubectl apply -f rbac-rolebinding.yaml
kubectl apply -f api-ns.yaml