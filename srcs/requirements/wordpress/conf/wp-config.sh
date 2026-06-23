#!/bin/bash

set -e

cd /var/www/html

echo "[wordpress] waiting for mariadb..."

until mysql -h mariadb -u "$DB_USER" -p"$DB_PASSWORD" -e "SELECT 1" 2>/dev/null; do
    sleep 2
done

if [ ! -f wp-config.php ]; then

    wp core download --allow-root

    wp config create \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASSWORD" \
        --dbhost="mariadb" \
        --allow-root

    wp core install \
        --url="$DOMAIN_NAME" \
        --title="$TITLE" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASSWORD" \
        --admin_email="$ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    wp user create "$USER_NAME" "$USER_EMAIL" \
        --user_pass="$USER_PASSWORD" \
        --role=subscriber \
        --allow-root
fi

mkdir -p /run/php
chown -R www-data:www-data /run/php

exec php-fpm7.4 -F
