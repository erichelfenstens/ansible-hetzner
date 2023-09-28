#!/bin/sh

clear && docker build . -t ansible_docker_image

docker run -it -v "$(pwd)/:/ansible" ansible_docker_image -f 10 playbooks/01-setup.yaml

docker run -it -v "$(pwd)/:/ansible" ansible_docker_image -f 10 playbooks/02-kubernetes.yaml

echo "---------------------------"
echo "FIM"
echo "---------------------------"
