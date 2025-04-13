#!/bin/bash

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/naadou.42.fr.key \
    -out /etc/nginx/ssl/naadou.42.fr.crt \
    -subj "/C=MA/ST=NA/L=Benguerir/O=42/OU=42/CN=naadou.42.fr/UID=nadaou"

exec nginx -g 'daemon off;'