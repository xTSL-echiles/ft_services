#!/bin/sh
/usr/bin/mysql_install_db --datadir="/var/lib/mysql"
/usr/bin/mysqld --user=root --init-file="/create_database.sql"

/usr/bin/supervisord -c /etc/supervisord.conf