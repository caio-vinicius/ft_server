#!/bin/bash

docker build -t i_ftserver .
docker run -itd -p 80:80 -p 443:443 --name c_ftserver i_ftserver
docker ps -a
