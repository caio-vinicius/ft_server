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
RUN ["apt-get", "install", "php-fpm", "php-mysql", "-y"]
#install the best text-editor of all time
RUN ["apt-get", "install", "vim", "-y"]
#remove packages already installed
RUN ["apt-get", "clean"]

ARG NGINXPATH=/src/nginx
ARG SSLCPATH=/etc/ssl
ARG MARIADBPATH=/src/mariadb
ARG PMAPATH=/src/pma

#copying key and certificate to configure ssl on nginx
COPY ["$NGINXPATH/ssl/nginx-selfsigned.crt", "$SSLCPATH/certs/"]
COPY ["$NGINXPATH/ssl/nginx-selfsigned.key", "$SSLCPATH/private/"]

#setup my own files on nginx
RUN ["rm", "-f", "/etc/nginx/sites-enabled/default"]
RUN ["rm", "-f", "/etc/nginx/sites-available/default"]
RUN ["rm", "-f", "/var/www/html/index.nginx-debian.html"]
COPY ["$NGINXPATH/html/", "/var/www/html/"]
COPY ["$NGINXPATH/sitesav/ft_server", "/etc/nginx/sites-available/"]
RUN ["ln", "-s", "/etc/nginx/sites-available/ft_server", "/etc/nginx/sites-enabled/"]

#setup mariadb
COPY ["$MARIADBPATH/dbconfig.sh", "/"]

#setup phpMyAdmin
ADD ["$PMAPATH/pma495.tar.gz", "/"]

#this container will be exposed on 80 and 443 port
EXPOSE 80/tcp 443/tcp

#copy script to execute things
COPY ["cmd.sh", "/"]
#execute cmd to start nginx and mariadb
ENTRYPOINT ["sh", "cmd.sh"] 
