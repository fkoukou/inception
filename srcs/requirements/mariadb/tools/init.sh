#!/bin/bash

set -e

echo "[mariadb] starting initialization..."

# initialize database ONLY if not already initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "[mariadb] first time setup..."

    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    service mariadb start

    until mysqladmin ping -h localhost --silent; do
        echo "Waiting for MariaDB..."
        sleep 1
    done

    mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
    mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';"
    mysql -e "FLUSH PRIVILEGES;"

    service mariadb stop
fi

echo "[mariadb] launching safe mode..."

exec mysqld_safe
