
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn -B dependency:go-offline

COPY src ./src

RUN mvn -B -DskipTests clean package



FROM eclipse-temurin:17-jre-noble

RUN useradd --system --create-home appuser

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

RUN chown appuser:appuser app.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]





# FROM maven:3.9.6-eclipse-temurin-17 AS build
# WORKDIR /app
# COPY pom.xml .
# RUN mvn -B dependency:go-offline
# COPY src ./src
# RUN mvn -B -DskipTests clean package
# FROM eclipse-temurin:17-jre-alpine
# RUN addgroup -S appgroup && \
#     adduser -S appuser -G appgroup
# WORKDIR /app
# COPY --from=build /app/target/*.jar app.jar
# RUN chown appuser:appgroup app.jar
# USER appuser
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "app.jar"]