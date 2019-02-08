#!/bin/bash

pathkey={1}

#copy files via SSH
scp -i $pathkey -r . ec2-user@ec2-18-188-72-79.us-east-2.compute.amazonaws.com:~

#exec deploy.sh on server
ssh -i $pathkey ec2-user@ec2-18-188-72-79.us-east-2.compute.amazonaws.com 'bash -s' < run.sh
