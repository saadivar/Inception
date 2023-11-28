#!/bin/bash

# Provide values for SQLDB, SQLUSER, and SQLPASS
SQLDB=$SQLDB
SQLUSER=$SQLUSER
SQLPASS=$SQLPASS

# Start MariaDB (if not already started)
# service mysql start  # Commented out since you're using mariadb commands
service mariadb start
sleep 5
# Create database, user, and grant privileges

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQLDB}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${SQLUSER}'@'%' IDENTIFIED BY '${SQLPASS}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${SQLDB}\`.* TO '${SQLUSER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop
sleep 1
mariadbd --user=root 2>/dev/null