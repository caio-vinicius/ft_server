FROM debian:buster

LABEL	version="1.0.0" \
	maintainer="Caio Vinicius"	

#install necessary things
RUN ["apt-get", "update", "-y"]
RUN ["apt-get", "upgrade", "-y"]
#install nginx
RUN ["apt-get", "install", "nginx", "-y"]
#install mariadb-server
RUN ["apt-get", "install", "mariadb-server", "-y"]
#install php fastcgi process manager and php-mysql
RUN ["apt-get", "install", "php-fpm", "php-mysql", "php-mbstring", "php-zip", "php-gd", "-y"]
#install the best text-editor of all time
RUN ["apt-get", "install", "vim", "-y"]
#remove packages already installed
RUN ["apt-get", "clean"]

ARG NGINXPATH=/srcs/nginx
ARG MARIADBPATH=/srcs/mariadb
ARG PMAPATH=/srcs/phpmyadmin
ARG WPPATH=/srcs/wordpress

#copying key and certificate to configure ssl on nginx
COPY ["$NGINXPATH/ssl/nginx-selfsigned.crt", "/etc/ssl/certs/"]
COPY ["$NGINXPATH/ssl/nginx-selfsigned.key", "/etc/ssl/private/"]

#setup nginx
RUN ["rm", "-f", "/etc/nginx/sites-enabled/default"]
RUN ["rm", "-f", "/etc/nginx/sites-available/default"]
RUN ["rm", "-rf", "/var/www/html"]
COPY ["$NGINXPATH/sites-available/ft_server", "/etc/nginx/sites-available/"]
RUN ["ln", "-s", "/etc/nginx/sites-available/ft_server", "/etc/nginx/sites-enabled/"]

#setup phpMyAdmin
ADD ["$PMAPATH/pma495.tar.gz", "/"]
RUN ["mv", "phpMyAdmin-4.9.5-english/", "/var/www/phpmyadmin"]
RUN ["mkdir", "-p", "/var/lib/phpmyadmin/tmp"]
RUN ["chmod", "777", "/var/lib/phpmyadmin/tmp"]
COPY ["$PMAPATH/config.inc.php", "/var/www/phpmyadmin/"]

#setup mariadb
COPY ["$MARIADBPATH/dbconfig.sh", "/"]

#setup wordpress
ADD ["$WPPATH/wplatest.tar.gz", "/"]
RUN ["mv", "wordpress/", "/var/www/"]
COPY ["$WPPATH/wp-config.php", "/var/www/wordpress/"]

#this container will be exposed on 80 and 443 port
EXPOSE 80/tcp 443/tcp

#copy script to execute things
COPY ["srcs/init.sh", "/"]
#execute sh to start nginx, mariadb and php-fpm
ENTRYPOINT ["sh", "init.sh"] 
