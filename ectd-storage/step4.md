## etcd storage setup

After the file is downloaded let's make a new directory called etcd-demo
`mkdir etcd-demo`{{execute HOST1}}

Change directory into the folder
`cd etcd-demo`{{execute HOST1}}

Download the etcd version used in the video 
`wget https://github.com/etcd-io/etcd/releases/download/v3.4.7/etcd-v3.4.7-linux-amd64.tar.gz`{{execute HOST1}}

Now the below code will extract the downloaded file and copy the etcdctl file to etcd-demo directory 
```
tar -zxvf etcd-v3.4.7-linux-amd64.tar.gz
cd etcd-v3.4.7-linux-amd64/
cp etcdctl ../
cd ..
```{{execute HOST1}}


Now lets copy the files
```
sudo cp /etc/kubernetes/pki/etcd/ca.crt ca.crt
sudo cp /etc/kubernetes/pki/etcd/healthcheck-client.crt healthcheck-client.crt
sudo cp /etc/kubernetes/pki/etcd/healthcheck-client.key healthcheck-client.key
```{{execute HOST1}}

Change the permission of healthcheck-client key file
`sudo chmod 644 healthcheck-client.key`{{execute HOST1}}

Now lets export the etcdctl_api to a env variable
`export ETCDCTL_API=3`{{execute HOST1}}

## Interact with etcd storage 

Now let use the auth material we have to interact with etcdctl, We will get keys using this command
`./etcdctl --endpoints=https://127.0.0.1:2379 --cacert=ca.crt --cert=healthcheck-client.crt --key=healthcheck-client.key get / --prefix --keys-only`{{execute HOST1}}

Now we can explore the keys and get values associated with it, to get the key we created lets grep the above output like this
`./etcdctl --endpoints=https://127.0.0.1:2379 --cacert=ca.crt --cert=healthcheck-client.crt --key=healthcheck-client.key get / --prefix --keys-only | grep 'admin-password'`{{execute HOST1}}

We can modify the above command  and get the value of the above key
`./etcdctl --endpoints=https://127.0.0.1:2379 --cacert=ca.crt --cert=healthcheck-client.crt --key=healthcheck-client.key get /registry/secrets/default/admin-password`{{execute HOST1}}

To take a snapshot of the etcd database execute the following command
`./etcdctl --endpoints=https://127.0.0.1:2379 --cacert=ca.crt --cert=healthcheck-client.crt --key=healthcheck-client.key snapshot save ~/etcd-demo/etcd.db`{{execute HOST1}}

To check if our admin password is saved in snapshot 
`strings etcd.db | grep 'admin@123'`{{execute HOST1}}

As we can see this is how we can explore the snapshot of a misconfigured etcd storage