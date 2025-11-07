#!/bin/sh

# Rebuild the new docker image
sudo docker build -t fedora . 

# Remove the old docker containers
sudo docker rm -f client_fedora server_fedora 

# Run the new docker containers
sudo docker run -itd --name server_fedora --network Erminig fedora
sudo docker run -itd --name client_fedora --network Erminig fedora

echo "images are up"

echo "examples of copying files to the server container"
echo "sudo docker cp ~/docker_network/lab1 server:/root/lab1"

echo "\nexample of finding the ip address of the server container"
echo "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' server"
