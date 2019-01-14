#!/bin/bash

BACKUP_FOLDER=/tmp/backup
BACKUP_FILE=$1

RESTORE_DATE=`date +%Y_%m_%d_%H_%M`

cp -R /root/.ethereum/keystore /root/.ethereum/keystore-backup-${RESTORE_DATE}

rm -rf ${BACKUP_FOLDER}
mkdir -p ${BACKUP_FOLDER}

tar -xzf ${BACKUP_FILE} -C ${BACKUP_FOLDER}/
cp -R ${BACKUP_FOLDER}/* /root/.ethereum/


rm -rf ${BACKUP_FOLDER}

echo Backup restored
