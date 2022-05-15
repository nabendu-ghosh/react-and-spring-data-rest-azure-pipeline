FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 80
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]