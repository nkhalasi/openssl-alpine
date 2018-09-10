#! /bin/bash
usage()
{
    echo "$0 <username> <firstname-lastname> <email>"
}
if [ $# != 3 ]
then
    usage
    exit
fi


docker run --name openssl-alpine --rm -e COUNTY="IN" -e STATE="MAHARASHTRA" -e LOCATION="PUNE" -e ORGANISATION="Vayana Network" -e ISSUER_CN="VNSPL-CA" -e ISSUER_NAME="VNSPL-CA" -e USERCERTFILE="$1" -e USERNAME="$2" -e USEREMAIL="$3" -e RSA_KEY_NUMBITS="2048" -e DAYS="3650" -v $PWD/internal-ca:/etc/ssl/certs:rw openssl-alpine:stripped
