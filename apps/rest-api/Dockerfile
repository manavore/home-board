FROM maven:3.6.3-jdk-11 AS build
COPY rest-spring-boot/ /usr/spring-server 
RUN mvn -f /usr/spring-server/pom.xml clean package

FROM openjdk:11.0.8-slim 
#RUN apk update && apk add bash
COPY --from=build /usr/spring-server/target/home-board-0.0.1-SNAPSHOT.jar /usr/app/homeboard.jar  
EXPOSE 8080  
CMD ["java","-jar","/usr/app/homeboard.jar"]  