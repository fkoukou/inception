#!/bin/sh
set -e

echo "Waiting DB..."
until mysqladmin ping -h mariadb -u"$DB_USER" -p"$DB_PASSWORD" --silent; do
    sleep 2
done

cd /var/www/html

rm -f index.nginx-debian.html

echo "Downloading WordPress..."
wp core download --allow-root

echo "Creating config..."
wp config create \
  --dbname="$DB_NAME" \
  --dbuser="$DB_USER" \
  --dbpass="$DB_PASSWORD" \
  --dbhost="mariadb" \
  --allow-root

echo "Installing WordPress..."
wp core install \
  --url="$DOMAIN_NAME" \
  --title="$TITLE" \
  --admin_user="$ADMIN_USER" \
  --admin_password="$ADMIN_PASSWORD" \
  --admin_email="$ADMIN_EMAIL" \
  --skip-email \
  --allow-root

echo "Creating user..."
wp user create "$USER_NAME" "$USER_EMAIL" \
  --role=author \
  --user_pass="$USER_PASSWORD" \
  --allow-root

exec php-fpm -F
