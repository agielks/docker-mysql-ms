# Docker MySQL Replication Master Slave

Simple docker setup to add replication feature to MySQL.

## Structure
```
mysql_master
    conf/                contains MySQL configurations for master
    data/                contains MySQL master data
    init/                contains the entrypoint shell script that runs on setup
    log/                 contains MySQL slave log files
mysql_slave
    conf/                contains MySQL configurations for slave
    data/                contains MySQL slave data
    init/                contains the entrypoint shell script that runs on setup
    log/                 contains MySQL slave log files
.env                     default docker environtment variables
docker-compose.yml
```

## Getting Started
- Change your MySQL version by editing variable `MYSQL_VERSION` in .env file
- Build your docker images by running `docker build`
- Run sample with command `docker compose up -d`

## Troubleshooting
### Check Logs
```docker-compose logs```

### Check Running Containers
```docker ps```

### Clean Data
```
rm -rf ./mysql_master/data/*
rm -rf ./mysql_master/log/*
rm -rf ./mysql_slave/data/*
rm -rf ./mysql_slave/log/*
```

### Check Master Status
```
docker exec -it mysql_master sh -c "mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e 'SHOW MASTER STATUS'";
```

### Check Slave Status
```
docker exec -it mysql_slave sh -c "mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e 'SHOW SLAVE STATUS \G'"
```
