#!/bin/bash 

# setup tomcat
dpkg -s "tomcat7" >/dev/null 2>&1 && {
	echo "tomcat7 is already installed."
} || {
    sudo apt-get update -y && apt-get install -y tomcat7 tomcat7-admin
}
sudo cp /vagrant/app/tomcat-users.xml /etc/tomcat7/tomcat-users.xml

# deploy app
host_ip=`netstat -rn | grep "^0.0.0.0 " | cut -d " " -f10 | head -1`
nexus_artifact="http://${host_ip}:8081/nexus/service/local/artifact/maven/redirect?r=snapshots&g=org.cloudfoundry.samples&a=spring-music&v=1.0-SNAPSHOT&p=war"

sudo apt-get install wget -y
sudo rm -Rf /var/lib/tomcat7/webapps/ROOT && wget -O /var/lib/tomcat7/webapps/ROOT.war $nexus_artifact
  
sudo service tomcat7 restart
