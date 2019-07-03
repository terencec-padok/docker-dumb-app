# Docker Dumb App

## Deployment

From the `ansible` folder, run:
```shell
ansible-playbook -i inventory.yml deploy.yml
```

To deploy a specific branch `branch_name`, run:
```shell
ansible-playbook -i inventory.yml deploy.yml --extra-vars "app_branch=branch_name"
```
