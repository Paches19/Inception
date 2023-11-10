FROM debian:buster

# Instalar NGINX
RUN apt-get update && apt-get install -y nginx openssl

# Limpiar cache de apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Configurar SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/adpachec.key -out /etc/nginx/ssl/adpachec.crt \
    -subj "/C=ES/ST=madrid/L=Madrid/O=42/CN=${DOMAIN_NAME}"

# Copiar archivos de configuración
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/sites-available/default

# Exponer puerto 443 para HTTPS
EXPOSE 443

# Iniciar NGINX
CMD ["nginx", "-g", "daemon off;"]
