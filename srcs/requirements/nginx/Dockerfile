# Imagen base
FROM debian:buster

# Instalar NGINX y las herramientas necesarias
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Generar y copiar certificados SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/nginx/ssl/adpachec.42.fr.pem \
    -keyout /etc/nginx/ssl/acpachec.42.fr.key \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=42/CN=adpachec.42.fr"

# Copiar la configuración personalizada de NGINX
COPY ./conf/nginx.conf /etc/nginx/nginx.conf.d

# Exponer el puerto 443 para el tráfico SSL
EXPOSE 443

# Comando para iniciar NGINX en modo foreground
CMD ["nginx", "-g", "daemon off;"]
