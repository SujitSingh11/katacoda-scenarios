

kubectl create namespace rbac-ns
kubectl apply -f service.yaml
kubectl apply -f role.yaml
kubectl apply -f rbac-rolebinding.yaml
kubectl apply -f api-ns.yaml

kubectl apply -f service2.yaml
kubectl apply -f clusterrole.yaml
kubectl apply -f clusterrole-binding.yaml
kubectl apply -f apiv2.yaml
