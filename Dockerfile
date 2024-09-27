# Stage 1: Build the application
FROM maven:3.9.0-eclipse-temurin-17 AS build

WORKDIR /app

# Copy the pom.xml and the source code
COPY pom.xml .
COPY src ./src

# Package the application as a WAR
RUN mvn clean package -DskipTests

# Stage 2: Create a minimal Tomcat image to run the WAR
FROM tomcat:9.0

# Remove the default web apps (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to the Tomcat webapps directory
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/yourapp.war

# Expose the default Tomcat port
EXPOSE 9090

# Start Tomcat
CMD ["catalina.sh", "run"]

