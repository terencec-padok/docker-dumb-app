#!/bin/bash

#Load the data script
source data.sh

# We are going to setup EC2 instance ubuntu 18.04. Execute this script only if you got the same server (hosted on AWS).
ssh -i $KEYNAME $SERVER 'bash -s' < setup.sh

