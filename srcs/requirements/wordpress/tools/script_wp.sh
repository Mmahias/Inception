#!/bin/bash

rm -rf wp-config.php

echo "Config wp"
wp --allow-root core config --dbhost='mariadb' --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --skip-check
echo "install"
wp --allow-root core install --url='localhost' --title='Inception' --admin_user='mmahias' --admin_password='mworld' --admin_email='mmahias@42.fr'

exec php-fpm7.3 -F