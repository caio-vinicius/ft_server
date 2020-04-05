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
#install the best text-editor of all time
RUN ["apt-get", "install", "vim", "-y"]
#remove packages already installed
RUN ["apt-get", "clean"]

ARG NGINXPATH=/src/nginx
ARG SSLPATH=/etc/ssl

#copying key and certificate to configure ssl on nginx
COPY ["$NGINXPATH/ssl/nginx-selfsigned.crt", "$SSLPATH/certs/"]
COPY ["$NGINXPATH/ssl/nginx-selfsigned.key", "$SSLPATH/private/"]

#setup my own files on nginx
RUN ["rm", "-f", "/etc/nginx/sites-enabled/default"]
RUN ["rm", "-f", "/etc/nginx/sites-available/default"]
RUN ["rm", "-f", "/var/www/html/index.nginx-debian.html"]
COPY ["$NGINXPATH/html/index.html", "/var/www/html/"]
COPY ["$NGINXPATH/sitesav/ft_server", "/etc/nginx/sites-available/"]
RUN ["ln", "-s", "/etc/nginx/sites-available/ft_server", "/etc/nginx/sites-enabled/"]

#start mysql
#RUN ["service", "mysql", "start"]

#this container will be exposed on 80 and 443 port
EXPOSE 80/tcp 443/tcp

#copy script to execute things
COPY ["cmd.sh", "/"]
#execute cmd to start nginx and mariadb
ENTRYPOINT ["sh", "cmd.sh"] 
