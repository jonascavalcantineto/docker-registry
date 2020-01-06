#!/bin/bash

CERTS_DIR=$1
#Country Name (2 letter code) [XX]
COUNTRY=$2
#State or Province Name (full name) []
STATE=$3
#Locality Name (eg, city) [Default City]
LOCALITY=$4
#Organization Name (eg, company) [Default Company Ltd]
ORGANIZATION=$5
#Organizational Unit Name (eg, section) []
ORGANIZATIONALUNIT=$6
#Common Name (eg, your name or your server's hostname) []   
COMMON_NAME=$7
#Email Address []
EMAIL=$8

if [ ! -d ${CERTS_DIR} ]
then
    mkdir -p ${CERTS_DIR}
fi

if [ ! -f ${CERTS_DIR}/${COMMON_NAME}.crt ]
then
    
    echo "Generating Certificates"
    cd ${CERTS_DIR}
    openssl req -new -newkey rsa:4096 -nodes \
        -keyout ${COMMON_NAME}.key -x509 -days 365 -out ${COMMON_NAME}.crt \
        -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/O=${ORGANIZATION}/OU=${ORGANIZATIONALUNIT}/CN=${COMMON_NAME}/emailAddress=${EMAIL}"

    echo "

    Cetification path: ${CERTS_DIR}
    Country Name (2 letter code) [XX]: ${COUNTRY}
    State or Province Name (full name) []: ${STATE}
    Locality Name (eg, city) [Default City]: ${LOCALITY}
    Organization Name (eg, company) [Default Company Ltd]: ${ORGANIZATION}
    Organizational Unit Name (eg, section) []: ${ORGANIZATIONALUNIT}
    Common Name (eg, your name or your server's hostname) []: ${COMMON_NAME}  
    Email Address []: ${EMAIL}

    "
        
else 
    echo "EXIST CERTICATES ON ${CERTS_DIR}"
fi