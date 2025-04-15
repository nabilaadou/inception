FROM debian:stable

RUN apt-get update && apt-get install vsftpd tini -y

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/ftp.sh /root/script/ftp.sh

RUN chmod +x /root/script/ftp.sh

EXPOSE 21

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["sh", "/root/script/ftp.sh"]