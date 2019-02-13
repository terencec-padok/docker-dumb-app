#!/bin/bash

cd app/
git clone https://github.com/padok-team/docker-dumb-app.git
git checkout $S

docker build -t docker-dumb-app-serv:v1 .
docker run -d -p 80:8080 --name dumb-app-docker docker-dumb-app-serv:v1