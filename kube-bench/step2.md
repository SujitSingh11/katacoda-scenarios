
## Install kube-bench
To install kube-bench run the code below

```
mkdir kube-bench
cd kube-bench/
sudo docker run --rm -v `pwd`:/host aquasec/kube-bench:latest install
ls kube-bench
```{{execute HOST1}}

## Run kube-bench
This command will show all the misconfiguration in the master and worker nodes

`sudo ./kube-bench`{{execute HOST1}}
