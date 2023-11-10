#!/bin/sh

# Iniciar el servicio de MariaDB
service mysql start

# Ejecutar el script SQL inicial
mysql < /usr/local/bin/init_db.sql

# Limpiar después de la ejecución
rm -f /usr/local/bin/init_db.sql

# Detener el servicio para que CMD pueda tomar el control
service mysql stop

# Ejecutar el comando pasado al contenedor (en este caso, mysqld)
exec "$@"