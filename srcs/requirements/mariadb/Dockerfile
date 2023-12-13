# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adpachec <adpachec@student.42madrid.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/13 13:45:26 by adpachec          #+#    #+#              #
#    Updated: 2023/12/13 13:51:49 by adpachec         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/init-mariadb.sh /
RUN chmod +x init-mariadb.sh

EXPOSE 3306

CMD ["/init-mariadb.sh"]
