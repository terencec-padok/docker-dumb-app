#!/bin/bash

if [ -d "~/app" ]; then
  rm -rf ~/app 
fi

mkdir ~/app
cp -a ~/docker-dumb-app/. ~/app
rm -rf ~/docker-dumb-app

#Suppression de l'environnement et des ressources
docker stop dumb-app-docker
docker rm dumb-app-docker
docker rmi dumb-app-serv:v1

#Création de l'image docker puis lancement du docker
docker build -t dumb-app-serv:v1 .
docker run -d -p 80:8080 --name dumb-app-docker dumb-app-serv:v1
