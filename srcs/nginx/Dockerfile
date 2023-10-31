# Imagen base de docker debian:buster
FROM debian:buster

# Instala nginx y openssl
RUN apt-get update && apt-get install -y nginx openssl

# Copiar la configuración de nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ssl/ /etc/ssl/
# Copia el script de entrada al contenedor
COPY ../requirements/entrypoint.sh /entrypoint.sh

# Abrir el puerto 443 para HTTPS para establecer la conexion
EXPOSE 443

# Configura el script como el punto de entrada
ENTRYPOINT ["/entrypoint.sh"]

# Ejecutar nginx en modo foreground (primer plano) para evitar
# su cierre por ser ejecutado como proceso daemon en segundo plano
CMD ["nginx", "-g", "daemon off;"]