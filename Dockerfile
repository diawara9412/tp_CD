FROM maven:3.9.4-eclipse-temurin-21-alpine as boot

COPY pom.xml ./
COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:21-ea-oraclelinux8

WORKDIR /app

COPY --from=boot target/*.jar my-appcd.jar

ENTRYPOINT ["java", "-jar", "my-appcd.jar"]
