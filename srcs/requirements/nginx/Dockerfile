FROM debian:stable

RUN apt-get update -y && apt-get install nginx openssl -y \
	&& apt-get install tini -y

COPY conf/nginx.conf /etc/nginx/conf.d/

COPY tools/ng.sh /root/script/ng.sh

RUN chmod +x /root/script/ng.sh

EXPOSE 443

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["sh", "/root/script/ng.sh"]