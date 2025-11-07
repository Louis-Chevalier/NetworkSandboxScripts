#!/bin/sh

# Create Network
docker network create -d bridge --internal Erminig
echo ""
echo "Created Erminig Network"
echo ""


# Rebuild the new docker image
sudo docker build -t fedora . 

# Run the new docker containers
sudo docker run -itd --name indexServer --network Erminig fedora
sudo docker run -itd --name peer1 --network Erminig fedora
sudo docker run -itd --name peer2 --network Erminig fedora

echo "Created 3 Containers below are their names:"
echo "indexServer"
echo "peer1"
echo "peer2"

echo ""

# Ask the user if they want to create more containers
read -p "Do you want to create more peer containers? (y/n): " choice

if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    read -p "Enter number of additional peers to create (1–5): " numPeers

    # Check if the input is within the valid range
    if [ "$numPeers" -ge 1 ] && [ "$numPeers" -le 5 ]; then
        startIndex=3
        endIndex=$((startIndex + numPeers - 1))

        for i in $(seq $startIndex $endIndex); do
            containerName="peer$i"
            echo "Creating container $containerName..."
            sudo docker run -itd --name "$containerName" --network Erminig fedora
        done

        echo "Successfully created $numPeers additional peer containers:"
        for i in $(seq $startIndex $endIndex); do
            echo "    peer$i"
        done
    else
        echo "Invalid number. Skipping additional container creation."
    fi
else
    echo "No additional containers created."
fi

echo ""
echo "Copy files or folder to a container:"
echo "sudo docker cp path/to/folder name_of_container:/root/"

echo "Display the IP address of a container:"
echo "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' name_of_container"
