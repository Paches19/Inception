FROM debian:buster

# Instalar PHP y extensiones necesarias
RUN apt-get update && \
    apt-get install -y php7.3 php7.3-fpm php7.3-mysqli wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configurar PHP-FPM para escuchar en el puerto 9000
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY wp-config.php /var/www/html/

# Exponer el puerto 9000
EXPOSE 9000

# Copiar el script de inicio
COPY ./tools/wordpress_start.sh /var/www/

# Dar permiso de ejecución al script
RUN chmod +x /var/www/wordpress_start.sh

# Establecer el directorio de trabajo
WORKDIR /var/www/html

# Comando para iniciar PHP-FPM y el script
CMD ["/var/www/wordpress_start.sh"]
