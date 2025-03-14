FROM debian:latest

RUN apt-get update -y && apt-get install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/localhost.key \
    -out /etc/nginx/ssl/localhost.crt \
    -subj "/C=US/ST=State/L=City/O=Company/OU=IT/CN=localhost"

COPY conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]