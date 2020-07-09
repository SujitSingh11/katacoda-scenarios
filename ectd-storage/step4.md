## etcd storage

Download the etcd version used in the video 
`wget https://github.com/etcd-io/etcd/releases/download/v3.4.7/etcd-v3.4.7-linux-amd64.tar.gz`{{execute HOST1}}

After the file is downloaded let's make a new directory called etcd-demo
`mkdir etcd-demo`{{execute HOST1}}

Now let's move the downloaded file in ectd-demo folder
`mv etcd-v3.4.7-linux-amd64.tar.gz ectd-demo`{{execute HOST1}}

Change directory into the folder
`cd etcd-demo`{{execute HOST1}}

Now the below code will extract the downloaded file and copy the etcdctl file to etcd-demo directory 
```
tar -zxvf etcd-v3.4.7-linux-amd64.tar.gz
cd etcd-v3.4.7-linux-amd64/
cp etcdctl ../
cd ..
```{{execute HOST1}}

