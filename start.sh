#!/bin/bash

docker build -t image_ftserver .
docker run -itd -p 80:80 -p 443:443 --name container_ftserver image_ftserver
echo -e "\e[32mRunning containers:\e[0m"
docker ps
echo -e "\e[32mLogs:\e[0m"
docker logs container_ftserver
