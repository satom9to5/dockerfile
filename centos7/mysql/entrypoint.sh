#!/bin/bash

MYSQLD=/sbin/mysqld
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-}

DATADIR=$(${MYSQLD} --verbose --help 2> /dev/null | awk '$1 == "datadir" { print $2; exit }')
DATADIR=${DATADIR:-/var/lib/mysql/}

if [ ! -d "${DATADIR}/mysql" ]; then
  mkdir -p ${DATADIR}
  chown -R mysql:mysql ${DATADIR}

  echo 'Initialize database.'
  /usr/bin/mysql_install_db --datadir=${DATADIR} --rpm --user=mysql --keep-my-cnf
  echo 'Database initialized.'
fi

echo 'temporary MySQL server start.'
/usr/sbin/mysqld --skip-networking --user=mysql &
pid="$!"

mysql_command="/usr/bin/mysql --protocol=socket -uroot"

# wait start MySQL process
for i in {40..0}; do
  if ${mysql_command} -e "SELECT 1" &> /dev/null; then
    break
  fi
  echo 'during MySQL start process'
  sleep 1
done

if [ $i -eq 0 ]; then
  echo >&2 'MySQL init failed.'
  exit 1
fi

exist_asterisk_root=$(${mysql_command} -e "SELECT * FROM mysql.user WHERE User = 'root' AND Host = '%'")

if [ -z "${exist_asterisk_root}" -a ! -z "${MYSQL_ROOT_PASSWORD}" ]; then
  ${mysql_command} << MRSQL
    CREATE USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
MRSQL
fi


echo 'temporary MySQL server stop.'
if ! kill -s TERM "${pid}" || ! wait "${pid}"; then
  echo >&2 'MySQL init failed.'
  exit 1
fi

/usr/bin/supervisord -n 
