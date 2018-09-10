#! /bin/bash

IMAGE_NAME=openssl-alpine

docker rmi $IMAGE_NAME:latest
docker rmi $IMAGE_NAME:stripped
docker build --rm --compress --no-cache --tag $IMAGE_NAME $PWD

docker run -t --name $IMAGE_NAME-instance $IMAGE_NAME:latest /bin/true

docker export `docker ps -q -n=1` | docker import --change 'ENV ROOT_CN="Root"' --change 'ENV ROOT_NAME="root"' --change 'ENV CERT_DIR="/etc/ssl/certs"' --change 'VOLUME ["/etc/ssl/certs"]' --change 'ENTRYPOINT ["/docker-entrypoint.sh"]' - $IMAGE_NAME:stripped

docker rm $IMAGE_NAME-instance
docker rmi $IMAGE_NAME:latest
