FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server

COPY  conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/database.sh /root/script/

RUN chmod +x /root/script/database.sh

EXPOSE 3306

CMD ["sh", "/root/script/database.sh"]