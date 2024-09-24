
FROM maven:4.0.0-openjdk-17-slim AS build
# Set the working directory in the container
WORKDIR /app
# Copy the pom.xml and the project files to the container
COPY pom.xml .
COPY src ./src

COPY src/main/webapp/views /app/views

# Build the application using Maven
RUN mvn clean package -DskipTests
# Use an official OpenJDK image as the base image
FROM openjdk:17-jdk-alpine
# Copy the built JAR file from the previous stage to the container
COPY target/*.jar app.jar
# Set the command to run the application
CMD ["java", "-jar", "app.jar" , "spring-boot:run"]

EXPOSE 9090
# -------------------------------
# # Stage 1: Build the application
# FROM maven:4.0.0-openjdk-17-slim AS build
#
# # Set the working directory in the container
# WORKDIR /app
#
# # Copy the pom.xml and the project files to the container
# COPY pom.xml .
# COPY src ./src
#
# # Build the application using Maven
# RUN mvn clean package -DskipTests
#
# # Stage 2: Create a lightweight container with the built app
# FROM openjdk:17-jdk-alpine
#
# # Set the working directory for the runtime container
# WORKDIR /app
#
# # Copy the built JAR file from the previous stage to the container
# COPY --from=build /app/target/*.jar app.jar
#
# # Copy JSP files into the container
# COPY src/main/webapp/views /app/views
#
# # Set the command to run the application
# CMD ["java", "-jar", "app.jar"]
#
# # Expose the port on which the app runs
# EXPOSE 9090
