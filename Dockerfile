FROM gradle:7-jdk17 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle buildFatJar --no-daemon


# FROM openjdk:17
#FROM   openjdk:17-jdk-alpine
FROM sapmachine:latest


RUN apt update
RUN apt full-upgrade -y

RUN apt install -y  apt-utils
RUN apt full-upgrade -y
RUN apt install  -y dialog mysql-server mysql-client libmariadb-java wget
# RUN  systemctl start mysql-server

# libmysql-java
# FROM ubuntu:23.10
# RUN apt -y update
# RUN apt install -y  mysql-server
# RUN apt install -y dialog apt-utils
# RUN apt full-upgrade -y

# RUN apt install -y  openjdk-21-jre mysql-server  mysql-client wget dpkg libmariadb-java
# RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j_8.3.0-1ubuntu23.10_all.deb
# RUN  dpkg -i ./mysql-connector-j_8.3.0-1ubuntu23.10_all.deb
RUN mkdir /app

RUN wget -O  /app/mysql-connector-j-8.3.0.jar https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.3.0/mysql-connector-j-8.3.0.jar

EXPOSE 8080:8080
COPY  /static/*.sql /static/
# COPY  ./mysql-connector-j-8.3.0.jar /app/mysql-connector-j-8.3.0.jar
ENV CLASSPATH=/app/mysql-connector-j-8.3.0.jar:${CLASSPATH}
COPY cmd.sh /app/cmd.sh

COPY --from=build /home/gradle/src/build/libs/*jar /app/ktor-mysql-backend.jar

RUN chmod +x /app/cmd.sh


# ENTRYPOINT ["java","-jar","/app/ktor-mysql-backend.jar"]
CMD app/cmd.sh