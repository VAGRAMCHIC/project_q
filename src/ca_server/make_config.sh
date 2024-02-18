#!/bin/bash
# First argument: Client identifier
KEY_DIR=~/clients/keys/
OUTPUT_DIR=~/clients/files/${1}
BASE_CONFIG=~/clients/base.conf

#mkdir ${KEY_DIR}${1}
mkdir ${OUTPUT_DIR}

cat ${BASE_CONFIG} \
<(echo -e '<ca>') \
${KEY_DIR}/ca.crt \
<(echo -e '</ca>\n<cert>') \
${KEY_DIR}/${1}/${1}.crt \
<(echo -e '</cert>\n<key>') \
${KEY_DIR}/${1}/${1}.key \
<(echo -e '</key>\n<tls-crypt>') \
${KEY_DIR}/ta.key \
<(echo -e '</tls-crypt>') \
> ${OUTPUT_DIR}/${1}.ovpn

# replace ip address to your public
sed -i 's/my-server-1/51.52.53.54/g' ${OUTPUT_DIR}/${1}.ovpn

cp ${KEY_DIR}/ca.crt ${OUTPUT_DIR}/
cp ${KEY_DIR}/${1}/${1}.crt ${OUTPUT_DIR}/
cp ${KEY_DIR}/${1}/${1}.key ${OUTPUT_DIR}/
cp ${KEY_DIR}/ta.key ${OUTPUT_DIR}/

cd ${OUTPUT_DIR} &&
tar czf ${1}.tar.gz .
