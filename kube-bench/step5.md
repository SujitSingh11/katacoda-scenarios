# kubeaudit

## Download and Extract
First we need to install the kubeaudit using wget and then extract it, run the code to do the following
```
wget https://github.com/Shopify/kubeaudit/releases/download/v0.7.0/kubeaudit_0.7.0_linux_amd64.tar.gz
tar -zxvf kubeaudit_0.7.0_linux_amd64.tar.gz
```{{execute HOST1}}

## Run kubeaudit
We can now run the kubeaudit on any of our yaml files
`./kubeaudit all -f malicious.yaml`{{execute HOST1}}