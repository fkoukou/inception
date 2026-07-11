#!/bin/bash
set -e
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi
echo "[mariadb] starting..."
mysqld_safe &
MYSQL_PID=$!

until mysqladmin ping -h 127.0.0.1 --silent; do
    echo "Waiting MariaDB..."
    sleep 1
done

echo "[mariadb] creating db..."

mysql -u root -p"${DB_ROOT_PASSWORD}"<< EOF
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "[mariadb] ready"
mysqladmin -u root -p"${DB_ROOT_PASSWORD}" shutdown
wait $MYSQL_PID

exec mariadbd --user=mysql
