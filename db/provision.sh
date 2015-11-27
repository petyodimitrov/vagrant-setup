#!/bin/bash 

dpkg -s "mongodb-org" >/dev/null 2>&1 && {
	echo "mongodb-org is already installed."
} || {
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
	sudo echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
	sudo apt-get update -y
	sudo apt-get install -y mongodb-org=3.0.7 mongodb-org-server=3.0.7 mongodb-org-shell=3.0.7 mongodb-org-mongos=3.0.7 mongodb-org-tools=3.0.7
}

# use custom config (enable 0.0.0.0 bind ip)
sudo cp /vagrant/db/mongod.conf /etc/mongod.conf

sudo service mongod restart
