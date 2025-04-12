#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# # Start MariaDB in the background and wait for it to be ready
# mysqld_safe &

# # Wait until MariaDB is ready
# until mariadb -u root -e "SELECT 1" > /dev/null 2>&1; do
#   echo "⏳ Waiting for MariaDB to be ready..."
#   sleep 2
# done

# echo "✅ MariaDB is ready!"

# # Create the database and user
# mariadb -u root <<EOF
# CREATE DATABASE IF NOT EXISTS $DB_NAME;
# CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY "$DB_PASSWORD";
# GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO $DB_USER@'%';
# FLUSH PRIVILEGES;
# EOF

# # Set the root password safely
# mariadb -u root <<EOF
# ALTER USER 'root'@'localhost' IDENTIFIED BY "$DB_ROOT_PASSWORD";
# EOF

# # Shutdown MariaDB to apply changes
# mysqladmin -uroot -p$DB_ROOT_PASSWORD Shutdown

# # Restart MariaDB in the foreground
# exec mysqld_safe

mysql_install_db
mysqld