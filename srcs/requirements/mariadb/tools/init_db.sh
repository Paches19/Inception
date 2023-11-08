#!/bin/sh

mysql_install_db

if [-d "/var/lib/mysql/wp-content"]
then
	echo "Database already exits"
else

/etc/init.d/mysql start

mysql_secure_installation << _EOF_
 
Y
\`${MYSQL_ROOT_PASSWORD}\`
\`${MYSQL_ROOT_PASSWORD}\`
Y
n
Y
Y
_EOF_

sleep 3

	mysql -e "CREATE DATABASE IF NOT EXISTS \`${WP_DB_NAME}\`;"
	mysql -e "CREATE USER IF NOT EXISTS \`${WP_DB_USER}\`@'localhost' IDENTIFIED BY '${WP_DB_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON \`${WP_DB_NAME}\`.* TO \`${WP_DB_USER}\`@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';"
	mysql -e "FLUSH PRIVILEGES;"

/etc/init.d/mysql stop

fi

exec "$@"