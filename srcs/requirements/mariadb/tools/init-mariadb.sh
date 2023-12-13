#!/bin/bash

MYSQL_INIT_FILE="/createdb.sql"

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

mysql_install_db >/dev/null 2>&1

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
	rm -f "$MYSQL_INIT_FILE"
	echo "CREATE DATABASE $MYSQL_DATABASE;" >> "$MYSQL_INIT_FILE"
	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> "$MYSQL_INIT_FILE"
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> "$MYSQL_INIT_FILE"
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> "$MYSQL_INIT_FILE"
	echo "FLUSH PRIVILEGES;" >> "$MYSQL_INIT_FILE"
	echo "Starting server"
	mysqld_safe --init-file=$MYSQL_INIT_FILE >/dev/null 2>&1
else
	echo "Starting server"
	mysqld_safe >/dev/null 2>&1
fi

# service mysqld_safe start

# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > db1.sql
# echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
# echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db1.sql
# echo "FLUSH PRIVILEGES;" >> db1.sql
# mysql < db1.sql

# kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld_safe
