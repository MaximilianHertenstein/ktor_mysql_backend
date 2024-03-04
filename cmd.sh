#!/bin/bash

mysqld &
java -cp /app/mysql-connector-j-8.3.0.jar -jar /app/ktor-mysql-backend.jar