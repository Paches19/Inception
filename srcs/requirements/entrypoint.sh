#!/bin/sh

# Crea el directorio si no existe (esto se ejecuta en el contenedor, no en el host)
mkdir -p /home/adpachec/
mkdir -p /home/adpachec/data
mkdir -p /home/adpachec/data/wordpress
mkdir -p /home/adpachec/data/mariadb

# Ejecuta el comando principal (por ejemplo, iniciar nginx o mariadb)
exec "$@"
