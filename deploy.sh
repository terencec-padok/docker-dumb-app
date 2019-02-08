#!/bin/bash

#Récupération du paramètre path
pathkey=$1

#copy files via SSH
scp -i $pathkey ./Dockerfile ./app.js ec2-user@ec2-18-188-72-79.us-east-2.compute.amazonaws.com:~/tmp

#exec deploy.sh on server
ssh -i $pathkey ec2-user@ec2-18-188-72-79.us-east-2.compute.amazonaws.com 'bash -s' < run.sh
