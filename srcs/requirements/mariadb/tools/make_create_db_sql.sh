#!bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then

cat << EOF > /tmp/create_db.sql

USE mysql;
FLUSH PRIVILEGES;
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='PUBLIC';
SET Password for 'root'@'localhost'=password('${DB_ROOT_PASSWORD}');
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld --bootstrap < /tmp/create_db.sql

fi