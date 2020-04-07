#!/bin/bash

docker stop container_ftserver
docker rm container_ftserver
docker rmi image_ftserver
