#!/bin/bash

# Esperar a que MariaDB esté completamente lista
# (ajusta el tiempo de espera según sea necesario)
sleep 10

# Ejecutar comandos SQL usando variables de entorno
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};"
mysql -u root -e "CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
