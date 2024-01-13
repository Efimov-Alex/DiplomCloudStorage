FROM openjdk:17 as build
EXPOSE 8080
ADD target/DiplomCloudStorage-0.0.1-SNAPSHOT.jar myapp.jar
ENTRYPOINT ["java","-jar","/myapp.jar"]