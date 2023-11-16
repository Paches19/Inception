FROM debian:buster

RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*

# Istall wordpress client
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

# Copy the .conf in the html directory
RUN	adduser -S nginx &&	addgroup -S nginx
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#Create the folder to enable php start
RUN mkdir /run/php

#We go the html directory
WORKDIR /var/www/html/

#we copy the script, give the right to launch it in local on our computer
COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]
