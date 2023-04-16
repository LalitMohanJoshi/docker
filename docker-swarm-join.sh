sudo yum check-update
curl -fsSL https://get.docker.com/ | sh
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker

docker swarm join --token SWMTKN-1-3wegsjp8tq1feh2bc2wlv9jhqr7pty0pbti73mnvsprt7x6093-c18zro8r7fljcait3mxpw54db 10.0.0.4:2377
 

# run this in primary node to promote another node as manager , so second node can access all resources

# docker node promote v2

# docker swarm leave