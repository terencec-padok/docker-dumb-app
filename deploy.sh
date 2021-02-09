if [ $# = 1 ]
then
    if [ `git ls-remote --heads https://github.com/terencec-padok/docker-dumb-app.git $1 | grep -o $1` ]
    then
        echo "This branch exists"
        cd ~ && mkdir -p padok && cd padok
        git clone --branch $1 https://github.com/terencec-padok/docker-dumb-app.git
        cd docker-dumb-app
        docker build . -t docker-dumb-app:$1
        docker run -p 8080:8080 docker-dumb-app:$1
    else    
        echo "This branch does not exist"
    fi
else
    echo "This script takes one argument : branch-name"
fi
