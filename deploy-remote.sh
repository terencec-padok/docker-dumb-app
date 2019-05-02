ssh -i $1 ec2-user@ec2-18-216-187-230.us-east-2.compute.amazonaws.com 'bash -s' < docker-dumb-app/deploy-local.sh $2
