#!/bin/bash

# editin the php conf file to listen to all ports
sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/8.2/fpm/pool.d/www.conf

# instalin the wp-cli
cd  /tmp
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# download wordpress
mkdir -p /var/www/html
cd /var/www/html
wp core download --allow-root

cp wp-config-sample.php wp-config.php

#linkin the mariadb database to ws
sed -i "s#database_name_here#$DB_NAME#g" /var/www/html/wp-config.php
sed -i "s#username_here#$DB_USER#g" /var/www/html/wp-config.php
sed -i "s#password_here#$DB_PASSWORD#g" /var/www/html/wp-config.php
sed -i "s#localhost#$DB_HOST#g" /var/www/html/wp-config.php

#installin wordpress
wp core install --url=naadou.42.fr --title="LAUNDRY DAY" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" \
	--admin_email="$WP_ADMIN_EMAIL" --allow-root --path=/var/www/html
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path=/var/www/html \
	--allow-root --path=/var/www/html

wp 

# redis setup
wp config set WP_CACHE true --raw --allow-root
wp config set WP_CACHE_KEY_SALT 'naadou.42.fr' --allow-root
wp config set WP_REDIS_HOST "$REDIS_HOST" --allow-root
wp config set WP_REDIS_PORT "$REDIS_PORT" --allow-root

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

/usr/sbin/php-fpm8.2 -F