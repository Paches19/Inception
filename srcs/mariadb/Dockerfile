# Usar Debian Buster como imagen base
FROM debian:buster

# Instalar MariaDB
RUN apt-get update && apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Exponer el puerto de MariaDB
EXPOSE 3306

# Establecer el script de inicio
CMD ["mysqld"]
