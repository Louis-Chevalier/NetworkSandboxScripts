# NetworkSandboxScripts
Scripts made to easily deploy containers in order to test out code C code for Network Projects. Made to imitate the COE768 lab configuration and allow students to test at home


# Docker Network Automation Script

## Overview
This project provides a simple shell script to automatically **build a Fedora-based Docker image** and create a network of containers for testing distributed systems, peer-to-peer setups, or networking labs.

The script:
- Builds a Docker image from the included `Dockerfile`
- Creates three default containers:
  - `indexServer`
  - `peer1`
  - `peer2`
- Optionally allows the user to create **1–5 additional peer containers** (`peer3`, `peer4`, …)
- Provides example commands for copying files and retrieving container IP addresses

---

## Prerequisites

Before using this script, ensure you have:

- **Docker** and **git** installed and running:
  ```bash
  sudo pacman -S docker    # Arch Linux
  sudo systemctl start docker
  sudo systemctl enable docker


## Usage

Make the sript executable
```bash
chmod +x createProjectContainers.sh
```

Then run the script
```bash 
./createProjectContainers.sh
```

Ensure all of the servers are up
```bash
docker ps
```
## Copying files between host and container
Next you can copy your code from the host to any of the containers.
```bash
docker cp path/to/files_or_folder name_of_container:/root/
```
This can copy files or entire folders to the containers.
If you copy files that already exist in the container, it will override them.
If you copy a folder that already exits, it will override existing files and add on additional files. Files that were present in folder before the copy and that are not present in the new version of the folder will no be overritten.

You can also copy file from the container back to the host.
```bash
docker cp name_of_container:/root/[path_to_file] path/of/host/directory 
```

## Cleanup
You also run the cleanup script. It will remove all the docker containers that were created during the script. Please ensure you save your work to the host before running this, as this will irreversably remove the containers.
```bash
./cleanup
```

If ever need to put the containers up again, just run the main script again
```bash 
./createProjectContainers.sh
```

## Checking the IP address of a container
Lastly, you may need the IP address of a container, in which case you just need to run
```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' name_of_container
```

# Note on Wireshark
When testing this setup and viewing the packets via wireshark, the packets did not appear under the regular `docker0` network. Instead, the packets could be viewed under a differently named container.
You may need ping one of the containers from another container. This way you can see which network in Wireshark suddendly spikes.
