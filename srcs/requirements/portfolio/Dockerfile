FROM debian:stable

RUN apt-get update -y && apt-get install nginx tini -y

COPY conf/nginx.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/html/assets

COPY tools/* /var/www/html

COPY tools/assets/* /var/www/html/assets/

EXPOSE 80

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["nginx", "-g", "daemon off;"]