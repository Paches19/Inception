FROM debian:buster

# Instalar MariaDB
RUN apt-get update && apt-get install -y mariadb-server && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar scripts y archivos de configuración
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/init_db.sh /usr/local/bin/

# Dar permiso de ejecución al script
RUN chmod +x /usr/local/bin/init_db.sh

# Puerto de MariaDB
EXPOSE 3306

# Comando por defecto para ejecutar MariaDB
CMD ["mysqld"]
