#!/bin/bash

# Update CentOS with any patches while excluding kernel packages
sudo yum update -y --exclude=kernel

# Tools
sudo yum install -y nano git unzip vim-enhanced tree

# Apache
sudo yum install httpd httpd-tools -y 

sudo systemctl start httpd

sudo systemctl enable httpd

sudo service httpd stop

sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

sudo service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download Starter Content (as vagrant user, in quiet mode)
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/screencasts-pro/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/screencasts-pro/vagrant/master/files/info.php

service httpd restart
