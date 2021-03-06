#!/bin/bash

FILE_PERMISSION_PATH=$1
ADMIN_REGISTRY_USER=$2
ADMIN_RESGITRY_PASSWD=$3

if [ -f ${FILE_PERMISSION_PATH}/registry.password  ]
then
    htpasswd -b ${FILE_PERMISSION_PATH}/registry.password ${ADMIN_REGISTRY_USER} ${ADMIN_RESGITRY_PASSWD}
else
    mkdir -p ${FILE_PERMISSION_PATH}
    htpasswd -cb ${FILE_PERMISSION_PATH}/registry.password ${ADMIN_REGISTRY_USER} ${ADMIN_RESGITRY_PASSWD}
fi