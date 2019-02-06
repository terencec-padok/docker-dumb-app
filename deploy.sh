#!/bin/bash

#creation repo + clonage de l'appli (branche master par défaut, autre si passée en paramètres)
mkdir application
cd ./application
git clone https://github.com/padok-team/docker-dumb-app.git
cd ./docker-dumb-app
git checkout ${1-master}

#Création de l'image docker puis lancement du docker
docker build -t dumb-app-serv:v1 .
docker run -d -p 80:8080 --name dumb-app-docker dumb-app-serv:v1
