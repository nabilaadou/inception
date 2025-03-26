FROM debian:latest

# Install required packages
RUN apt-get update -y && apt-get install php8.2-fpm php8.2-mysql php8.2-cli php8.2-curl \
    php8.2-gd php8.2-mbstring php8.2-xml php8.2-zip wget unzip curl -y

RUN mkdir -p /var/www/html

# instalin the wp-li
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# download wordpress
RUN cd /var/www/html \
    && wp core download --allow-root \
    && mv wp-config-sample.php wp-config.php \
    && wp config set SERVER_PORT 3306 --allow-root

RUN wp config set DB_NAME "name" --allow-root --path=/var/www/html \
    && wp config set DB_USER "user" --allow-root --path=/var/www/html \
    && wp config set DB_PASSWORD "123" --allow-root --path=/var/www/html \
    && wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html

RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf

# # Expose PHP-FPM port (to communicate with Nginx)
EXPOSE 9000

CMD ["/usr/sbin/php-fpm8.2", "-F"]