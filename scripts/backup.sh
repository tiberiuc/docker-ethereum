#!/bin/bash

BACKUP_FOLDER=/tmp/backup
BACKUP_FILE=/tmp/ethereum_wallet.tgz

rm -f ${BACKUP_FILE}
rm -rf ${BACKUP_FOLDER}
mkdir -p ${BACKUP_FOLDER}

cp -R /root/.ethereum/keystore ${BACKUP_FOLDER}

cd ${BACKUP_FOLDER} && tar -czf ${BACKUP_FILE} *

cd /

rm -rf ${BACKUP_FOLDER}

echo ${BACKUP_FILE}
