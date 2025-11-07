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
