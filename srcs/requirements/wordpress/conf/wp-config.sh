#!/bin/bash
set -e
mkdir  -p /var/www/html

if [ ! -f /usr/local/bin/wp ]; then
    curl -o /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp
fi
# hna kandiroh bach nbedlo listen ta3 php-fpm 
sed -i 's|listen = /run/php/php.*-fpm.sock|listen = 9000|' \
/etc/php/7.4/fpm/pool.d/www.conf

cd /var/www/html

echo "[wordpress] waiting for mariadb..."

until mysqladmin ping -h mariadb -u "$DB_USER" -p"$DB_PASSWORD" --silent; do
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

exec php-fpm7.4 -F