#!/bin/bash

mysqld &
mysql -u  root  -h  172.17.0.1 -p 3306 --protocol=tcp /app/create_user.sql
java  -jar /app/ktor-mysql-backend.jar