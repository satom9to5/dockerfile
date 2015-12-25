#!/bin/bash

#MYSQL_USER=''
#MYSQL_PASSWORD=''

service mysqld start
if [ "${MYSQL_USER}" -a "${MYSQL_PASSWORD}" ]; then
  mysql -uroot -e "CREATE USER ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'"
fi

mysql -uroot -e "CREATE USER root@'%' IDENTIFIED BY ''"
