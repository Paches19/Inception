# Imagen base de docker debian:buster
FROM debian:buster

# Actualizar paquetes e instalar dependencias
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    nginx \
    php-fpm \
    php-mysql \
    php-gd \
    php-xml \
    php-curl

# Configurar php-fpm
RUN echo "cgi.fix_pathinfo=0" >> /etc/php/7.3/fpm/php.ini && \
    sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/7.3/fpm/php-fpm.conf

# Descargar e instalar WordPress
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    mv wordpress/* . && \
    rmdir wordpress && \
    rm latest.tar.gz && \
    chown -R www-data:www-data /var/www/html

# Exponer puerto 9000 para PHP-FPM
EXPOSE 9000

# Arrancar php-fpm
CMD ["php-fpm7.3"]
