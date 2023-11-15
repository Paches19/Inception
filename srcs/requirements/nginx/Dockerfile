FROM	debian:buster

#install all the program
RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl

# Configure SSL and create certificates
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/adpachec.crt \
    -keyout /etc/nginx/ssl/adpachec.key \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=42 Campus/OU=adpachec/CN=adpachec/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# Init nginx config 
RUN mkdir -p /run/nginx

#Expose the only allow port
EXPOSE	443

# Start nginx daemon off (in foreground)
CMD ["nginx", "-g", "daemon off;"]
