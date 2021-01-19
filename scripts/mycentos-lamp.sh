#!/bin/bash

# Update CentOS with any patches while excluding kernel packages
sudo yum update -y --exclude=kernel

# Tools
sudo yum install -y  git 

# Apache
sudo yum install httpd httpd-tools -y 

sudo systemctl start httpd

sudo systemctl enable httpd

sudo service httpd stop

sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

sudo service httpd start

# PHP
sudo yum install -y php php-cli php-common php-devel 

# MySQL (in another dimension will install db-server with yum)
# yum install -y mysql mysql-server mysql-devel
# chkconfig --add mysqld
# chkconfig mysqld on

# service mysqld start

# mysql -u root -e "SHOW DATABASES";

# Download Starter Content (as vagrant user, in quiet mode)
 cd /vagrant
 sudo -u vagrant wget -q https://raw.githubusercontent.com/sgdaw1041/myvagrant/main/files/index.html
 sudo -u vagrant wget -q https://raw.githubusercontent.com/sgdaw1041/myvagrant/main/files/info.php

sudo service httpd restart

