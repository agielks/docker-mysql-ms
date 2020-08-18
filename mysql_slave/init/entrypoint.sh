while ! mysqladmin ping -hmysql_master --silent; do
    sleep 5
done

CURRENT_POS="$(mysql -hmysql_master -uroot -p$MYSQL_ROOT_PASSWORD -e 'SHOW MASTER STATUS \G' | grep Position | grep -o '[0-9]*')"
CURRENT_LOG="$(mysql -hmysql_master -uroot -p$MYSQL_ROOT_PASSWORD -e 'show master status \G' | grep File | sed -n -e 's/^.*: //p')"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"CHANGE MASTER TO MASTER_HOST='mysql_master',MASTER_USER='$MYSQL_REP_USER', MASTER_PASSWORD='$MYSQL_REP_PASSWORD', MASTER_LOG_FILE='$CURRENT_LOG', MASTER_LOG_POS=$CURRENT_POS;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"START SLAVE;"