FROM gradle:7-jdk17 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle buildFatJar --no-daemon


#FROM openjdk:11
FROM   openjdk:17-jdk-alpine3.14
EXPOSE 8080:8080
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/*jar /app/ktor-mysql-backend.jar
COPY  /static/*.sql /static/

ENTRYPOINT ["java","-jar","/app/ktor-mysql-backend.jar"]