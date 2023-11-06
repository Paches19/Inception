# Use Debian Buster as base image
FROM debian:buster

# Installl MariaDB
RUN sudo apt-get update && apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/* \
    # purge and re-create /var/lib/mysql with appropriate ownership
    && mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    # ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
    && chmod 777 /var/run/mysqld

# Expose MariaDB port
EXPOSE 3306

# Copy and launch the init script
COPY tools/init_db.sh /usr/local/bin/init_db.sh
RUN chmod +x /usr/local/bin/init_db.sh
ENTRYPOINT ["sh", "/usr/local/bin/init_db.sh"]
