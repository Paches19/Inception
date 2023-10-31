#!/bin/sh

# Crea el directorio si no existe (esto se ejecuta en el contenedor, no en el host)
mkdir -p /ruta/del/directorio

# Ejecuta el comando principal (por ejemplo, iniciar nginx o mariadb)
exec "$@"
