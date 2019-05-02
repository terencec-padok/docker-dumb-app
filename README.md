# Deployment of docker-dumb-app

Scripts for local (dev stage) and remote (prod stage) deployment of a small nodejs app.

## Getting Started

Make sure you have docker and nodejs installed.
Clone the git repo and branch you are interested in.

### Dev stage

Run the deploy-local.sh script.

```
deploy-local.sh <branch>
```
Make the changes you what to the app.
Push commit and push yout code.

### Prod stage

Run the deploy-remote script to publish on the aws ec2 unit.

```
deploy-remote.sh <branch> <path/to/key>
```

## Authors

manu
