#!/bin/bash

set -e

cd /var/www/html

until mysqladmin ping -h mariadb --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done

if [ ! -f wp-config.php ]; then

    wp core download --allow-root

    wp config create \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD \
        --dbhost=mariadb \
        --allow-root

    wp core install \
        --url=$DOMAIN_NAME \
        --title=$TITLE \
        --admin_user=$ADMIN_USER \
        --admin_password=$ADMIN_PASSWORD \
        --admin_email=$ADMIN_EMAIL \
        --skip-email \
        --allow-root

    wp user create $USER_NAME $USER_EMAIL \
        --user_pass=$USER_PASSWORD \
        --role=subscriber \
        --allow-root
fi

chown -R www-data:www-data /var/www/html

exec php-fpm7.4 -F
