-- Crear la base de datos para WordPress
CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear usuario de WordPress
GRANT ALL ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';

-- Crear usuario administrador (reemplaza 'admin_username' y 'admin_password' con tus preferencias)
GRANT ALL ON ${WP_DB_NAME}.* TO 'admin_username'@'%' IDENTIFIED BY 'admin_password';

-- Aplicar privilegios
FLUSH PRIVILEGES;
