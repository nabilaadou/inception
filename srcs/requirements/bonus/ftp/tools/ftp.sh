#!/bin/bash

mkdir -p /var/www/html
useradd -m ftpuser
chown -R ftpuser:ftpuser /var/www/html
echo "ftpuser:123" | chpasswd

mkdir -p /var/run/vsftpd/empty

exec /usr/sbin/vsftpd /etc/vsftpd.conf