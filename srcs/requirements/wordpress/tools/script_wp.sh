#!/bin/bash

MY_USER="mysql"
MY_PWORD="helloworld"
DB_NAME="wordpress"

rm -rf wp-config.php
echo "Downloading wp"
wp-cli --allow-root core download
echo "Config wp"
wp-cli --allow-root config create --dbname=DB_NAME --dbuser=MY_USER --dbpass=MY_PWORD
echo "install"
wp-cli --allow-root core install --url='localhost' --title='Inception' --admin_user='mmahias' --admin_password='mworld' --admin_email='mmahias@42.fr'

exec php-fpm7.3 -F
