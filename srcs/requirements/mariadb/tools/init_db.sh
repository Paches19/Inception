#!/bin/sh

mysql_install_db
if [ $? -ne 0 ]; then
  echo "Failed to install MySQL."
  exit 1
fi

if [ -d "/var/lib/mysql/wp-content" ]; then
  echo "Database already exists."
  exit 1
else

  /etc/init.d/mysql start
  if [ $? -ne 0 ]; then
    echo "Failed to start MySQL."
    exit 1
  fi

  mysql_secure_installation << _EOF_
Y
\`${MYSQL_ROOT_PASSWORD}\`
\`${MYSQL_ROOT_PASSWORD}\`
Y
n
Y
Y
_EOF_

  if [ $? -ne 0 ]; then
    echo "Failed to secure MySQL installation."
    /etc/init.d/mysql stop
    exit 1
  fi

  sleep 3

  mysql -e "CREATE DATABASE IF NOT EXISTS \`${WP_DB_NAME}\`;"
  if [ $? -ne 0 ]; then
    echo "Failed to create database."
    /etc/init.d/mysql stop
    exit 1
  fi

  mysql -e "CREATE USER IF NOT EXISTS \`${WP_DB_USER}\`@'localhost' IDENTIFIED BY '${WP_DB_PASSWORD}';"
  if [ $? -ne 0 ]; then
    echo "Failed to create user."
    /etc/init.d/mysql stop
    exit 1
  fi

  mysql -e "GRANT ALL PRIVILEGES ON \`${WP_DB_NAME}\`.* TO \`${WP_DB_USER}\`@'%';"
  if [ $? -ne 0 ]; then
    echo "Failed to grant privileges."
    /etc/init.d/mysql stop
    exit 1
  fi

  mysql -e "FLUSH PRIVILEGES;"
  if [ $? -ne 0 ]; then
    echo "Failed to flush privileges."
    /etc/init.d/mysql stop
    exit 1
  fi

  /etc/init.d/mysql stop
fi

exec "$@"
