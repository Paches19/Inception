# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adpachec <adpachec@student.42madrid.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/13 12:45:42 by oboutarf          #+#    #+#              #
#    Updated: 2023/12/13 20:57:42 by adpachec         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update && apt-get install -y curl \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-common \
    mariadb-client \
    sendmail \
    wget

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
        && chmod +x wp-cli.phar \
        && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html \
        && chown -R www-data:www-data /var/www/html

RUN chmod -R 755 /var/www/html

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/init-wordpress.sh /var/www/init-wordpress.sh

RUN chmod +x /var/www/init-wordpress.sh

RUN mkdir -p /run/php

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/var/www/init-wordpress.sh"]
