FROM openjdk:17
ARG JAR_FILE=./target/*.jar
COPY ${JAR_FILE} VEHICULOS.jar
ENTRYPOINT ["java","-jar","/VEHICULOS.jar"]