#!/bin/sh

#check if wordpress already downloaded

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Update configuration file
	rm -rf /etc/php/7.3/fpm/pool.d/www.conf
	mv ./www.conf /etc/php/7.3/fpm/pool.d/

	#Inport env variables in the config file
	cd /var/www/html/wordpress
	sed -i "s/username_here/$WP_DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WP_DB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$WP_HOST_NAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$WP_DB_NAME/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php

fi

exec "$@"