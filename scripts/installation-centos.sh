# 1 install basic dependency

sudo yum update -y
sudo yum install epel-release -y
sudo yum install nodejs -y
sudo yum install npm -y
node --version
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl status httpd
# manage selinux policy

sudo setsebool -P httpd_unified 1
hostname -I

# 2 create apacahe error logs

mkdir -p /var/www/logs/
cd /var/www/logs/ 
touch docker-app-error.log
chmod -R 777 /var/www/logs/

# 3 install git

sudo yum install git -y
git --version

# 4 setup application in local system

mkdir -p /var/www/html/
chmod -R 777 /var/www/html/
cd /var/www/html/ 
git clone https://github.com/LalitMohanJoshi/docker.git

# cd docker


# 5 create vhost config
 
chmod -R 777 /etc/httpd/conf.d
cp /var/www/html/docker/scripts/dockerAppVhost.conf  /etc/httpd/conf.d/dockerAppVhost.conf

cp /var/www/html/docker/scripts/hosts  /etc/hosts
# cd /etc/httpd/conf.d

# touch dockervhost.conf
# nano dockervhost.conf

# 6 install docker

sudo yum check-update
curl -fsSL https://get.docker.com/ | sh
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker

# 7 run app in detach mode , Like - pm2

cd /var/www/html/docker/
# docker compose up -d

sudo systemctl status httpd 
sudo systemctl restart httpd 
sudo systemctl status httpd 

# enable revere proxy for localhost

setsebool -P httpd_can_network_connect on