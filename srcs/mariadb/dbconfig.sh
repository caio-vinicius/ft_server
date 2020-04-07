#!/bin/bash

mysql -e "UPDATE mysql.user SET Password=PASSWORD('1234') WHERE User='root';"
mysql -e "DELETE FROM mysql.user WHERE User='';"
mysql -e "DELETE FROM mysql.user WHERE User='root' AND HOST NOT IN ('localhost', '127.0.0.1', '::1');"
mysql -e "DROP DATABASE IF EXISTS test;"
mysql -e "DELETE FROM mysql.db WHERE Db='test' or Db='test\\_%';"
mysql -e "GRANT ALL ON *.* TO 'caio'@'localhost' IDENTIFIED BY '1234' WITH GRANT OPTION;"

mysql -e "GRANT ALL ON phpmyadmin.* TO 'caio'@'localhost' IDENTIFIED BY '1234';"
mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -e "GRANT ALL ON wordpress.* TO 'caio'@'localhost' IDENTIFIED BY '1234';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "SOURCE /var/www/phpmyadmin/sql/create_tables.sql;"
