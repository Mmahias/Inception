#!/bin/bash


#rm -rf wp-config.php
rm -rf /var/www/html/wp-config.php
echo "Downloading wp"
wp --allow-root core download
echo "Config wp"
wp --allow-root config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --path="/var/www/html"
echo "install"
wp --allow-root core install --url='localhost' --title='Inception' --admin_user='mmahias' --admin_password='mworld' --admin_email='mmahias@42.fr' --path="/var/www/html"

exec php-fpm7.3 -F