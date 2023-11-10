#!/bin/bash

# Función para verificar si MariaDB está lista
wait_for_mariadb() {
    while ! mysqladmin ping -h"localhost" --silent; do
        echo "Esperando a que MariaDB esté lista..."
        sleep 1
    done
}

# Esperar a que MariaDB esté completamente lista
wait_for_mariadb

# Ejecutar comandos SQL usando variables de entorno
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};"
mysql -u root -e "CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

