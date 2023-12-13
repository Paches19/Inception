#!/bin/sh

wp core download --allow-root;
wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --allow-root;
wp core install --allow-root --url=adpachec.42.fr --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_MAIL --allow-root;
wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWD --allow-root;

wp option update comment_previously_approved 0 --allow-root;
wp option update comments_notify 0 --allow-root;
wp option update moderation_notify 0 --allow-root;

echo "Wordpress already installed, skipping download and configuration."


/usr/sbin/php-fpm7.4 --nodaemonize
