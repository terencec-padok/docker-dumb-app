#!/usr/bin/env bash

git clone https://github.com/padok-team/docker-dumb-app.git
cd docker-dumb-app

git checkout ${1}

# copy ressource to ec2
scp -r ../docker-dumb-app ec2-user@ec2-15-188-14-115.eu-west-3.compute.amazonaws.com:~/
 
# Execute Build script && run Image on port 3000
ssh ec2-user@ec2-15-188-14-115.eu-west-3.compute.amazonaws.com 'bash -s' < ../build_run.sh
