FROM debian:stable

RUN apt-get update -y && apt-get install -y \
    wget \
    php \
	php-mysqli \
    tini

RUN mkdir -p /var/www/html

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php"

RUN mv adminer-4.8.1.php /var/www/html/index.php

WORKDIR /var/www/html

EXPOSE 8080

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["php", "-S", "0.0.0.0:8000"]