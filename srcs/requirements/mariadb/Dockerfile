FROM debian:stable

RUN apt-get update && apt-get install mariadb-server tini -y

COPY  conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/database.sh /root/script/

RUN chmod +x /root/script/database.sh

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["sh", "/root/script/database.sh"]