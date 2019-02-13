#!/bin/bash

#Change this variable by the name of your user on the remote server.
USER="ubuntu"

#Install docker & add user to group docker.
sudo apt install docker.io -y
sudo usermod -aG docker $USER

mkdir app




