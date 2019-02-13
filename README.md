# Padok Script Test

## Getting Started

Some values are hidden in a gitignore so you need to create a file containing them named `data.sh`:

```
#!/bin/bash
#SERVER mean the server which we will connect to deploy our project.
export SERVER=<USER>@<DNS>
#Modify KeyName by yours
export KEYNAME="KeyName"
#Don't forget to change this value if you want to apply this project on yours
export REPONAME=docker-dumb-app
#Change this value if your remote server user is not ubuntu
export USER="ubuntu"
```

You can add permission to this file
```
chmod ug+x+w data.sh
```



## First Launch

On the first launch of this project, execute `setup.sh` in order to setup your remote server (Install Docker and add your user to the docker group)
```
./setup.sh
```

Then execute `push.sh` in order to deploy the desired branch of your project. You'll need to renseign which branch you want to deploy during the execution of the script.
```
./push.sh
```

## Regular Launch

Clean the remote server before deploy another time by executing `purge.sh`:
```
./purge.sh
```

Then execute `push.sh` in order to deploy the desired branch of your project.
```
./push.sh
```

## Author

* Matthieu LANVERT (coached by AURORE MALHERBES)






