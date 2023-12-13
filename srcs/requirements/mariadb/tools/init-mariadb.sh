#!/bin/bash

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

mysql_install_db >/dev/null 2>&1

if [ ! -d "/var/lib/mysql/$DB_DATABASE" ]; then
	rm -f "$MYSQL_INIT_FILE"
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > "$MYSQL_INIT_FILE"
	echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> "$MYSQL_INIT_FILE"
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> "$MYSQL_INIT_FILE"
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> "$MYSQL_INIT_FILE"
	echo "FLUSH PRIVILEGES;" >> "$MYSQL_INIT_FILE"
	mysqld_safe --init-file=$MYSQL_INIT_FILE >/dev/null 2>&1
else
	mysqld_safe >/dev/null 2>&1
fi
