FROM debian:buster

#install necessary things
RUN ["apt-get", "update", "-y"]
RUN ["apt-get", "upgrade", "-y"]
#install nginx
RUN ["apt-get", "install", "nginx", "-y"]
#install openssl to configure TLS/SSL on nginx server
RUN ["apt-get", "install", "openssl", "-y"]
#generate certificate and private key with openssl
RUN ["openssl", "req", "-x509", "-nodes", "-days", "365", "-newkey", "rsa:2048", "-keyout", "/etc/ssl/private/nginx-selfsigned.key", "-out", "/etc/ssl/certs/nginx-selfsigned.crt"]
#install mariadb-server
#RUN ["apt-get", "install", "mariadb-server"]
RUN ["apt-get", "install", "vim", "-y"]
RUN ["apt-get", "clean"]

#setup my own files on nginx
RUN ["rm", "-f", "/etc/nginx/sites-enabled/default"]
RUN ["rm", "-f", "/etc/nginx/sites-available/default"]
RUN ["rm", "-f", "/var/www/html/index.nginx-debian.html"]
COPY ["src/html/", "/var/www/html"]
COPY ["src/sitesav/", "/etc/nginx/sites-available/"]
RUN ["ln", "-s", "/etc/nginx/sites-available/ft_server", "/etc/nginx/sites-enabled/"]

#this container will be exposed on 80 and 443 port
EXPOSE 80 443

#run nginx on foreground
CMD ["nginx", "-g", "daemon off;"]
