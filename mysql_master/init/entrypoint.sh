mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"CREATE USER $MYSQL_REP_USER@'%' IDENTIFIED BY '$MYSQL_REP_PASSWORD';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"GRANT REPLICATION SLAVE ON *.* TO $MYSQL_REP_USER@'%';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"FLUSH PRIVILEGES;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"SHOW MASTER STATUS;"