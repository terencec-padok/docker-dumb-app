#!/bin/sh

# Check if the user has supplied the branch name as an argument to the script
if [ $# = 1 ]
then
    branch=$1
    # Check if the branch exists
    branch_exists=`git ls-remote --heads git@github.com:terencec-padok/docker-dumb-app.git $branch | grep -o $branch`
    if [ $branch_exists ] 
    then
        # Create a specific directory for the app
        cd ~ && mkdir -p padok && cd padok
        # Replace the existing directory by a fresh cloned one if it already exists
        if [ -d "docker-dumb-app_$branch" ]
        then
            rm -rf docker-dumb-app_$branch
        fi
        git clone --quiet --branch $branch git@github.com:terencec-padok/docker-dumb-app.git docker-dumb-app_$branch
        cd docker-dumb-app_$branch
        # Stop and remove an existing container running the app after checking if it exists
        container_exists=`docker ps --filter name=docker-dumb-app | grep -o docker-dumb-app:$branch`
        if [ $container_exists ]
        then
            docker stop docker-dumb-app && docker rm docker-dumb-app 
        fi
        # Build the image
        docker build --quiet --no-cache . -t docker-dumb-app:$branch
        # Run the image detached with port mapping
        docker run -d -p 8080:8080 --name docker-dumb-app docker-dumb-app:$branch
    else    
        echo "This branch does not exist"
    fi
else
    echo "This script takes one argument : branch-name"
fi
