FROM debian:stable

RUN apt-get update -y \
    && apt-get install \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-cli \
    php8.2-curl \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-zip \
    php-redis \
    curl \
    tini -y

COPY tools/ws.sh /root/script/ws.sh

RUN chmod +x /root/script/ws.sh

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["sh", "/root/script/ws.sh"]