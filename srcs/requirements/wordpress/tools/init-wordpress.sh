#!/bin/sh

mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;

if [ -f ./wp-config.php ]; then
    echo "Wordpress already installed, skipping download and configuration."
else
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
    chmod +x wp-cli.phar;
    mv wp-cli.phar /usr/local/bin/wp;

	chmod -R 775 /var/www/html
	chown -R www-data:www-data /var/www/html;

	wp core download --allow-root;
	wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --allow-root;
	wp core install --allow-root --url=adpachec.42.fr --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_MAIL --allow-root;
	wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWD --allow-root;

	wp option update comment_previously_approved 0 --allow-root;
	wp option update comments_notify 0 --allow-root;
	wp option update moderation_notify 0 --allow-root;

fi

/usr/sbin/php-fpm7.4 --nodaemonize
