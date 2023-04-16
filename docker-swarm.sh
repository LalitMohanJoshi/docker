docker swarm init
# [root@v1 docker]# docker swarm init
# Swarm initialized: current node (jig4y7dmhhczq7jl9t794not3) is now a manager.

# To add a worker to this swarm, run the following command:

# docker swarm join --token SWMTKN-1-3wegsjp8tq1feh2bc2wlv9jhqr7pty0pbti73mnvsprt7x6093-c18zro8r7fljcait3mxpw54db 10.0.0.4:2377

 
# To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
cd /var/www/html/docker

# do docker login to access private repo

docker login -u lalitdemo -p dckr_pat_QF0M7Y0AirqSOC-xnZfmRcF6nuk

docker stack deploy -c docker-compose-swarm.yaml dockerApps --with-registry-auth
 
# this command can take to fully deploy all services
docker image ls
docker service ls
docker ps

docker stack rm dockerApps

# stop container & remove images

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q) 

docker rmi $(docker images -q)
docker volume prune -f

# get the list of connected machine in swarm
docker node ls

# scale service amoung multiple nodes
docker service scale dockerApps_web-server=5

# check log of a service
docker service logs --timestamps --tail 10 dockerApps_web-server

# for debugging docker stack
journalctl -f -n10
 
connect using internal ip -  curl 10.0.0.4:3000

# forcely making current node as manager 

docker swarm init --force-new-cluster