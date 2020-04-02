FROM debian:buster

RUN ["apt-get", "update", "-y"]
RUN ["apt-get", "upgrade", "-y"]
RUN ["apt-get", "install", "nginx", "-y"]

CMD ["bash"]
