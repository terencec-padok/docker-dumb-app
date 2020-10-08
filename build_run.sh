cd docker-dumb-app

# clean
docker stop docker-dumb-app
docker rm docker-dumb-app
docker rmi docker-dumb-app

# build and run
docker build -t docker-dumb-app .
docker run -d -p 3000:8080 --name docker-dumb-app docker-dumb-app:latest

