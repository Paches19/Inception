#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Install the database if it's not already installed
mysql_install_db

# Check if the WordPress database directory already exists
if [ -d "/var/lib/mysql/wp-content" ];
then
	echo "Database already exits"
else

	/etc/init.d/mysql start
	# Start the database server

	# Secure the installation
	mysql_secure_installation << _EOF_
	
Y
\`${MYSQL_ROOT_PASSWORD}\`
\`${MYSQL_ROOT_PASSWORD}\`
Y
n
Y
Y
_EOF_
	# Give the server time to start up before running additional commands
	sleep 3

    # Create the WordPress database and user
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${WP_DB_NAME}\`;"
	mysql -e "CREATE USER IF NOT EXISTS \`${WP_DB_USER}\`@'localhost' IDENTIFIED BY '${WP_DB_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON \`${WP_DB_NAME}\`.* TO \`${WP_DB_USER}\`@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';"
	mysql -e "FLUSH PRIVILEGES;"

	/etc/init.d/mysql stop

fi

exec "$@"