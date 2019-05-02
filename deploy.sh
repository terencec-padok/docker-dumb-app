# REMOVE FORMER IMAGE AND CONTAINERS
sudo docker stop dumb-app-con
sudo docker rm dumb-app-con
sudo docker rmi dumb-app-img

# BUILD AND RUN
sudo docker build -t dumb-app-img https://github.com/padok-team/docker-dumb-app.git#$1
sudo docker run -d --name dumb-app-con -p 3000:8080 dumb-app-img
