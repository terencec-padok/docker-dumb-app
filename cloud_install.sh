eval `ssh-agent`

tar -zxvf /workspace/philippe-key.tar.gz
mv philippe-formation.pem  ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

ssh ec2-user@ec2-15-188-14-115.eu-west-3.compute.amazonaws.com 'bash -s' < ./docker_cloud_update.sh
