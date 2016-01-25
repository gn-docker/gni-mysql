MySQL Container
===============

Container for GNI MySQL databsase

Install
-------

It assumes to run from an SSD drive mounted on /opt/gni

```
sudo mkdir -p /opt/gni/backup
sudo mkdir /opt/gni/mysql
sudo mkdir /opt/gni/log
sudo mkdir /opt/gni/config
cd /opt/gni
sudo chown 301:301 -R mysql
sudo chown 301:301 -R log

Copy start/restart/stop scripts from script directory to
/usr/local/bin directory on the host

copy my.cnf and production.env to /opt/gni/conf

run gni-mysql-start script
```

Create databases:

Copy GNI backup `*.sql.gz` file to /opt/gni/backup on the node

```
docker exec gni-mysql /create-gni-db.sh
```

