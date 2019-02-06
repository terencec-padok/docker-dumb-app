#!/bin/bash

#Suppression de l'environnement et des ressources
docker stop dumb-app-docker
docker rm dumb-app-docker
docker rmi dumb-app-serv:v1
rm -rf ./application

