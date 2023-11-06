# Imagen base de docker debian:buster
FROM debian:buster

# Actualizar paquetes e instalar dependencias
RUN apt-get update && apt-get install -y \
	wget \
	unzip \
	nginx \
	php \
	php-fpm \
	php-mysql \
	php-gd \
	php-xml \
	php-curl \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	&& rm -rf /var/lib/apt/lists/*

#Copy the necessary tools to download wordpress

COPY ./conf/www.conf /var/www/html/

# Configurar php-fpm
# RUN echo "cgi.fix_pathinfo=0" >> /etc/php/7.3/fpm/php.ini && \
# 	sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/7.3/fpm/php-fpm.conf

#Create the folder to enable php start
RUN mkdir /run/php

#we copy the script, give the right to launch it in local on our computer
COPY ./tools/init_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init_wp.sh
ENTRYPOINT ["/usr/local/bin/init_wp.sh"]

WORKDIR /var/www/html

# Exponer puerto 9000 para PHP-FPM
EXPOSE 9000

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
CMD ["/usr/sbin/php-fpm7.3", "-F"]
