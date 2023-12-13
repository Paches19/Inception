#!/bin/sh

if [ -f ./wp-config.php ]
then
    echo "Wordpress already installed, skipping download and configuration."
else
    wp core download --allow-root;
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root;
    wp core install --allow-root --url=https://adpachec.42.fr --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_MAIL --allow-root;
    wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWD --allow-root
    wp option update comment_previously_approved 0 --allow-root;
    wp option update comment_notify 0 --allow-root;
    wp option update moderation_notify 0 --allow-root;
    wp theme install escutcheon --activate --allow-root
fi

/usr/sbin/php-fpm7.3 -F -R
