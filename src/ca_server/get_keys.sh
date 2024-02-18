#!/bin/sh
# first argument used for get keyname and create his path in the keys dir
NAME=${1}

cp ~/easy-rsa/pki/ca.crt keys/
cp ~/easy-rsa/pki/ta.key keys/
cd keys && mkdir ${NAME} && cd ${NAME} \
    && cp ~/easy-rsa/pki/issued/${NAME}.crt . \
    && cp ~/easy-rsa/pki/private/${NAME}.key .
