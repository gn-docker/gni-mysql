#!/bin/bash

BACKUP_DIR=/opt/ubio/backup

if [ "$(ls $BACKUP_DIR | grep gz)" ]; then
  echo "Creating GNI databases..."
  cd $BACKUP_DIR
  shopt -s nullglob
  for f in *.gz
  do
    db=${f%.sql.gz}
    echo "  loading '$db'"
    mysql -uroot -e "DROP DATABASE IF EXISTS $db"
    mysql -uroot -e "CREATE DATABASE $db"
    gunzip -c $f | mysql -uroot $db
  done
else
  echo "========================================================================"
  echo "GNI DB Backup directory '$BACKUP_DIR' does not exist or empty"
  echo "========================================================================"
fi
