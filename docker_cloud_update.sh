# add gcloud to path
source ~/.bashrc

# clean docker 
docker rm -f docker-dumb-app
docker rmi gcr.io/padok-training-lab/docker-dumb-app
docker pull gcr.io/padok-training-lab/docker-dumb-app

# start app
docker run --name docker-dumb-app -p 3000:8080 -d gcr.io/padok-training-lab/docker-dumb-app:latest
