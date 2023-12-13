#!/bin/sh

if [ -f ./wp-config.php ]
then
    echo "Wordpress already installed, skipping download and configuration."
else
    # wp core download --allow-root;
    # wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root;
    # wp core install --allow-root --url=https://adpachec.42.fr --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_MAIL --allow-root;
    # wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWD --allow-root
    # wp option update comment_previously_approved 0 --allow-root;
    # wp option update comment_notify 0 --allow-root;
    # wp option update moderation_notify 0 --allow-root;
    # wp theme install escutcheon --activate --allow-root
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;
	chmod -R 775 /var/www/html/wordpress;
	chown -R www-data:www-data /var/www/html/wordpress;
	cd /var/www/html/wordpress;

	wp core download --allow-root;
	wp config create --allow-root \
				--dbname=$MYSQL_DATABASE \
				--dbhost=mariadb:3306 \
				--dbprefix=wp_ \
				--dbuser=$MYSQL_USER \
				--dbpass=$MYSQL_PASSWORD;

	wp core install --allow-root \
				--url=$DOMAIN_NAME \
				--title=wordpress \
				--admin_user=${WP_ADMIN} \
				--admin_password=${WP_ADMIN_PASSWD} \
				--admin_email=${WP_ADMIN_MAIL};

	wp user create ${WP_USER} ${WP_USER_MAIL} --user_pass=${WP_USER_PASSWD} --role=author --allow-root;
	wp option update comment_previously_approved 0 --allow-root;
	wp option update comments_notify 0 --allow-root;
	wp option update moderation_notify 0 --allow-root;

	wp theme install escutcheon --activate --allow-root
fi

/usr/sbin/php-fpm7.3 --nodaemonize
