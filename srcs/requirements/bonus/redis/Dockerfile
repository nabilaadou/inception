FROM debian:stable

RUN apt-get update -y && apt-get install redis-server tini -y

COPY tools/redis.sh /root/script/redis.sh

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["sh", "/root/script/redis.sh"]