service nginx start
service mysql start
service php7.3-fpm start
sh /etc/nginx/sites-available/autoindex.sh
sh dbconfig.sh
tail -F /dev/null
