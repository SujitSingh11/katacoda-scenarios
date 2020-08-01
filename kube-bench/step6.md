# Kubesec

## Install and run
To install the kubesec we will use docker command and run the scan on the malicious.yaml

`sudo docker run - kubesec/kubesec:eb00a8f scan /dev/stdin < malicious.yaml`{{execute HOST1}}