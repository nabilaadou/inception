FROM debian:latest

RUN apt-get update -y && apt-get install nginx openssl -y

COPY conf/nginx.conf /etc/nginx/conf.d/

COPY tools/ng.sh /root/script/ng.sh

RUN chmod +x /root/script/ng.sh

EXPOSE 443

CMD ["sh", "/root/script/ng.sh"]

# sudo docker run -d -p 443:443 --add-host naadou.42.fr:127.0.0.1 nginx
