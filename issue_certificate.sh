#! /bin/bash

docker run --name openssl-alpine --rm -e COUNTY="IN" -e STATE="MAHARASHTRA" -e LOCATION="PUNE" -e ORGANISATION="Vayana Network" -e ISSUER_CN="VNSPL-CA" -e ISSUER_NAME="VNSPL-CA" -e PUBLIC_CN="$1" -e PUBLIC_NAME="$1" -e RSA_KEY_NUMBITS="2048" -e DAYS="365" -v $PWD/internal-ca:/etc/ssl/certs:rw openssl-alpine:stripped
