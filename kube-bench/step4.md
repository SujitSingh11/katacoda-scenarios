# Trivy

## Install and run kube-hunter
This command will pull the docker image of trivy and shellshock then scan the shellshock image for vulnerabilities

`docker run --rm -v 'pwd':/root/.cache/ aquasec/trivy getcapsule8/shellshock:test`{{execute HOST1}}