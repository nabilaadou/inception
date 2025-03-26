FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server

COPY tools/database.sh /root/script/

RUN chmod +x /root/script/database.sh

CMD ["sh", "/root/script/database.sh"]