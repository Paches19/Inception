#!/bin/sh

#check if wp-config.php exist
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

	wp core download --allow-root
    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$MYSQL_ROOT_USR --admin_password=$WP_ADMIN_PWD --admin_email=$MYSQL_ROOT_EMAIL --skip-email --allow-root
    wp user create $MYSQL_USER $MYSQL_EMAIL --role=author --user_pass=$MYSQL_PASSWORD --allow-root
    wp theme install inspiro --activate --allow-root

	#Inport env variables in the config file
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

fi

echo "Wordpress started on port 9000"
/usr/sbin/php-fpm7 -F -R