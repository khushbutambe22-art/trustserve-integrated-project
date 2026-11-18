FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY src ./src
COPY public ./public
RUN mkdir -p out && javac -encoding UTF-8 -d out src/main/java/com/trustserve/*.java
EXPOSE 8080
CMD ["java", "-cp", "out", "com.trustserve.TrustServeServer"]
