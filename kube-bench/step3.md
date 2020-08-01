
## Install and run kube-hunter
This command will pull the docker image of kube-hunter and then scan the cluster for vulnerabilities

`docker run --rm aquasec/kube-hunter --cidr 172.17.0.0/24`{{execute HOST1}}

## Trobleshoot
If any error from the above command make sure the network address is same as the current system
To check the IP address

`ifconfig`{{execute HOST1}}