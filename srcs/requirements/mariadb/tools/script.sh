#!/bin/bash

MY_USER="mysql"
MY_PWORD="helloworld"
ROOT_PWORD="rootworld"

echo "Config mariadb..."
if [ ! -d "/var/lib/mysql/mysql" ]; then
    service mysql start
    echo "CREATE"
    echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql
    echo "GRANT"
    echo "GRANT ALL ON wordpress.* TO '$MY_USER'@'%' IDENTIFIED BY '$MY_PWORD' WITH GRANT OPTION;" | mysql
    echo "FLUSH"
    echo "FLUSH PRIVILEGES;" | mysql
    echo "SET"
    echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$ROOT_PWORD');" | mysql 
    echo "SET/SERVICE"
    service mysql stop
fi
rm /etc/mysql/my.cnf && touch /etc/mysql/my.cnf
echo "[mysqld]" >> /etc/mysql/my.cnf 
echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf

echo "SERVICE"

mysqld --user=mysql --console

echo "END"