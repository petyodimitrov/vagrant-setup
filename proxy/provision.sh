#!/bin/bash

# install nginx
dpkg -s "nginx" >/dev/null 2>&1 && {
	echo "nginx is already installed."
} || {
    sudo apt-get update -y && apt-get install -y nginx
}

# setup nginx as reverse proxy
sudo cp /vagrant/proxy/default.conf /etc/nginx/conf.d/default.conf
sudo rm /etc/nginx/sites-enabled/* >/dev/null 2>&1

# deploy static content
host_ip=`netstat -rn | grep "^0.0.0.0 " | cut -d " " -f10 | head -1`
nexus_artifact="http://${host_ip}:8081/nexus/service/local/artifact/maven/redirect?r=snapshots&g=org.cloudfoundry.samples&a=spring-music&v=1.0-SNAPSHOT&p=zip&c=static"
zip_file=/tmp/spring-music-static.zip

sudo apt-get install wget unzip -y
sudo rm /tmp/spring-music-static.zip
sudo rm -Rf /usr/share/nginx/assets 
wget -O $zip_file $nexus_artifact && unzip $zip_file -d /usr/share/nginx/assets

sudo service nginx reload
