#!/bin/bash
ssh 35.239.158.44 /bin/bash << EOF
cd docker-dumb-app
if [ $# -eq 0 ] ; then
    echo specify a branch
    exit 0
fi
git checkout $1
if [ $? -ne 0 ]; then
    echo Branch doesnt exist
    exit 0
fi
git pull
docker build -t dumb-docker-app .
docker stop docker-dumb-app
if [ $? -eq 0 ]; then
    echo Suppresion du container en prod
    docker rm docker-dumb-app
else
    echo Pas de container en prod deployment en cours
fi
docker run -d -p 8080:8080 --name docker-dumb-app dumb-docker-app:latest
echo container en production 

EOF