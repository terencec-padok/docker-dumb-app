#!/bin/bash

#Load variables
source data.sh

#Install docker & add user to group docker.
ssh -i $KEYNAME $SERVER << EOF
    echo "[ ] Docker Installation"
    sudo apt install docker.io -y
    echo "[X] Docker Installation"
    echo "[ ] Adding user to docker group"
    sudo usermod -aG docker $USER
    echo "[X] Adding user to docker group"
EOF