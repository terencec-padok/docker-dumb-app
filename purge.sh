#!/bin/bash

#Load variables
source data.sh

#Install docker & add user to group docker.
ssh -i $KEYNAME $SERVER << EOF
    docker stop $REPONAME
    docker system prune -a -f
    rm -rf $REPONAME/
EOF