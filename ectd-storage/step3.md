## Create a secret file 

The below code will create a secret and write it in a file called secret.txt
`echo -n 'admin@123' > ./secret.txt`{{execute HOST1}}

Now let's create a secret with kubectl from the file we create above
`kubectl create secret generic admin-password --from-file=./secret.txt`{{execute HOST1}}

After executing the above code a secret called admin-password will be created 

## Check the created secret

Now to check if the secret is created using this command
`kubectl get secret`{{execute HOST1}}

We can check the secret by adding the name of the secret from above command
`kubectl get secret admin-password`{{execute HOST1}}

As you can see in the above output we cannot check the what is the value of secret
To get more details on the secret execute the below code
`kubectl get secret admin-password -o json`{{execute HOST1}}

We can see the password is encrypted in base64 we can decode it by using the following command
`echo "YWRtaW5AMTIz" | base64 -d`{{execute HOST1}}

