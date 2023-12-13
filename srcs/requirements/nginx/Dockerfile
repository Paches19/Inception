# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adpachec <adpachec@student.42madrid.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/04 18:12:26 by oscobou           #+#    #+#              #
#    Updated: 2023/12/13 13:44:37 by adpachec         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN		apt-get update && apt-get install -y nginx \
    openssl

COPY    conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/ssl/adpachec.42.fr.pem  \
    -keyout /etc/ssl/adpachec.42.fr.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=adpachec/CN=adpachec.42.fr"

RUN mkdir -p /run/nginx

EXPOSE  443

CMD     ["nginx", "-g", "daemon off;"]
