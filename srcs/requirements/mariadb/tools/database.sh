#!/bin/sh

# Start MariaDB in the background and wait for it to be ready
mysqld_safe &
until mysqladmin ping --silent; do sleep 1; done

# Create the database and user
mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS name;
CREATE USER IF NOT EXISTS user@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON name.* TO user@'%';
FLUSH PRIVILEGES;
EOF

# Set the root password safely
mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123');"

# Shutdown MariaDB to apply changes
mysqladmin -uroot -p123 shutdown

# Restart MariaDB in the foreground
exec mysqld_safe
