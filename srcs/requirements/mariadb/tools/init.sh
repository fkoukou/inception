#!/bin/bash
set -e

echo "[mariadb] starting..."
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi
mysqld_safe --datadir=/var/lib/mysql &
MYSQL_PID=$!

until mysqladmin ping -h 127.0.0.1 --silent; do
    echo "Waiting MariaDB..."
    sleep 1
done

echo "[mariadb] creating db..."

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "[mariadb] ready"

wait $MYSQL_PID