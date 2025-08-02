# Use an official Maven image to build the application
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline
# Copy the source code and build the application
COPY src ./src
RUN mvn clean install -DskipTests

# Use a smaller, official OpenJDK image to run the application
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
# Copy the JAR file from the build stage
ARG JAR_FILE=target/backend-0.0.1-SNAPSHOT.jar
COPY --from=build /app/${JAR_FILE} app.jar
# Expose the port the application runs on
EXPOSE 8082
# Set the command to run the application
ENTRYPOINT ["java","-jar","app.jar"]
