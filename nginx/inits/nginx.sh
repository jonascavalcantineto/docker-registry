#!/bin/bash

if [ ${SSL} == "true" -a ! -f ${CERTS_DIR}/${COMMON_NAME}.crt ]
then
    /certOpensslGenerator.sh ${CERTS_DIR} \
                            ${COUNTRY} \
                            ${STATE}   \
                            ${LOCALITY} \
                            ${ORGANIZATION} \
                            ${ORGANIZATIONALUNIT} \
                            ${COMMON_NAME} \
                            ${EMAIL}
fi


if [ ! -f ${FILE_PERMISSION_PATH}/registry.password ]
then
    /userApacheNginxGenarator.sh ${FILE_PERMISSION_PATH} ${ADMIN_REGISTRY_USER} ${ADMIN_RESGITRY_PASSWD}
fi

cat /var/run/nginx.pid 2>/dev/null
if [ $? != 0 ]
then
    echo "Stating Nginx"
    /usr/sbin/nginx -c /etc/nginx/nginx.conf 
fi