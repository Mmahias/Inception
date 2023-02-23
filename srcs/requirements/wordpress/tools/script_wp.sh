#!/bin/bash

rm -rf wp-config.php

echo "Config wp"
wp --allow-root core config --dbhost='mariadb' --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --skip-check
echo "install"
wp --allow-root core install --url='localhost' --title='Inception' --admin_user='mmahias' --admin_password='mworld' --admin_email='mmahias@42.fr'

exec php-fpm7.3 -F
