#!/bin/bash

# Función para verificar si MariaDB está lista
wait_for_mariadb() {
    while ! mysqladmin ping -h"localhost" --silent; do
        echo "Esperando a que MariaDB esté lista..."
        sleep 1
    done
}

# Llama a init_db.sh para inicializar la base de datos
/usr/local/bin/init_db.sh

# Esperar a que MariaDB esté completamente lista
wait_for_mariadb

# Ejecutar el proceso principal de MariaDB
exec "$@"
