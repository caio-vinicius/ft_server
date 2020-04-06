service nginx start
service mysql start
service php7.3-fpm start
sh dbconfig.sh
tail -F /dev/null
