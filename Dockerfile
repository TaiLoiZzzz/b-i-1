FROM maven:3.8-eclipse-temurin-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests -DfailOnMissingWebXml=false

FROM tomcat:8.5-jre8
COPY --from=build /app/target/emailFirst.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
