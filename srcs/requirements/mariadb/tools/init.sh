#!/bin/bash

set -e

echo "[mariadb] starting..."

mysqld_safe --datadir=/var/lib/mysql &
sleep 5

until mysqladmin ping -h 127.0.0.1 --silent; do
    echo "Waiting for MariaDB..."
    sleep 1
done

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

wait
