#!/bin/bash

# editin the php conf file to listen to all ports
sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/8.2/fpm/pool.d/www.conf


mkdir -p /var/www/html

# instalin the wp-cli
cd  /tmp
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# download wordpress
cd /var/www/html
wp core download --allow-root

cp wp-config-sample.php wp-config.php

#linkin the mariadb database to ws
sed -i "s#database_name_here#$DB_NAME#g" /var/www/html/wp-config.php
sed -i "s#username_here#$DB_USER#g" /var/www/html/wp-config.php
sed -i "s#password_here#$DB_PASSWORD#g" /var/www/html/wp-config.php
sed -i "s#localhost#$DB_HOST#g" /var/www/html/wp-config.php
#DB_COLLATE in the wp-config-sample.php is being changed

#installin wordpress
wp core install --url=naadou.42.fr --title="LAUNDRY DAY" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" \
	--admin_email="$WP_ADMIN_EMAIL" --allow-root --path=/var/www/html
wp user create $.en $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path=/var/www/html \
	--allow-root --path=/var/www/html

exec /usr/sbin/php-fpm8.2 -F