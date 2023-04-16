# Docker Demo - [ Deployment of Node App]

This repository contain node application deployed through Docker in vm instance.
It contain all the necessary package to run docker app in docker environment.
We have added docker compose to run multiple docker image using config file.

This demo also contain the information of docker swarm , which is used to scale docker container in large environment.

## Installation

Use the package manager [Docker](https://www.docker.com/) to install the dependencies.
And run below command as per your needs.

```bash
# 1. create docker image
    docker build . -t "test"

# 2. run docker image
    docker run -it -p 3000:3000 -d --name webApp test

# 3. get running container list
    docker ps

# 4. run multiple docker image using docker compose - run multiple services
    docker compose up -d

# 5. check docker images in local system
    docker image ls

# 6. stop docker compose
    docker compose stop

# 7. check docker container logs
    docker logs --follow docker-web-1

# 8.  check docker image info
    docker image inspect  ffd287e43d20 

# 9.  pull image from docker  =hub & run in local
    docker pull nginx

# 10. stop docker container
    docker stop webApp

# 11. visit into a docker container
    docker exec cid

# 12. login into docker hub - we can also make own registery for storing docker container image
    docker login

# 13.  push changes in docker hub 
    docker login -u lalitdemo -p
    commit docker container image - docker container commit fb8a61784fdb lalitdemo/node-app:latest
    push docker image to docker hub - docker push lalitdemo/node-app:latest