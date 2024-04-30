# Use the official OpenJDK image as a parent image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the target directory into the container at /app
COPY target/*.jar /app/app.jar

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["java", "-jar", "app.jar"]
