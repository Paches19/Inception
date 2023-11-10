#!/bin/bash

	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
	chown -R www-data:www-data /var/www/*;
	chown -R 755 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Wordpress: setting up..."
	mkdir -p /var/www/html
	# Descargar e instalar WordPress
    wget https://wordpress.org/latest.tar.gz;
    tar -xzf latest.tar.gz;
    mv wordpress/* .;
    rmdir wordpress;
    rm latest.tar.gz;
    mv /var/www/wp-config.php /var/www/html/
	# Descargar e instalar WP-CLI
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/
	echo "Wordpress: creating users..."
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=root --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_DB_USER} ${WP_USER_EMAIL} --user_pass=${WP_DB_PASSWORD};
	echo "Wordpress: set up!"
fi

exec php-fpm7.3 -F