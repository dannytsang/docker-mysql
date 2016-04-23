#!/bin/bash
# Configuration. Change if necessary
MYSQL_ROOT_FOLDER=/var/lib/mysql
MYSQL_LOG_FOLDER=/var/log/mysql

# Check MYSQL storage folder exists
if [ ! -d $MYSQL_ROOT_FOLDER ]; then
	sudo mkdir $MYSQL_ROOT_FOLDER
	# Set permissions
	sudo chown -R mysql:mysql $MYSQL_ROOT_FOLDER
	sudo chown -R 700 $MYSQL_ROOT_FOLDER
	echo "Created mysql folder"
fi

sudo docker run --name mysql -v $MYSQL_ROOT_FOLDER:/var/lib/mysql -v $MYSQL_LOG_FOLDER:/var/log/mysql --env-file ~/config/mysql/envlist.txt -d -p 3306:3306 --restart=always mysql:5.7
sudo docker ps
