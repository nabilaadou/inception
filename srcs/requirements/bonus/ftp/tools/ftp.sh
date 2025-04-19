#!/bin/bash

mkdir -p /var/www/html
useradd -m ftpuser
chown -R ftpuser:ftpuser /var/www/html
echo "ftpuser:$FTPUSER_PASSWORD" | chpasswd

mkdir -p /var/run/vsftpd/empty

/usr/sbin/vsftpd /etc/vsftpd.conf