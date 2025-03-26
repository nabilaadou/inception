FROM debian:latest

RUN apt-get update -y && apt-get install nginx openssl -y

COPY conf/nginx.conf /etc/nginx/conf.d/

COPY tools/script.sh /root/script/

RUN chmod +x /root/script

EXPOSE 443

CMD ["sh", "/root/script/script.sh"]