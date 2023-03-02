# Project Title

spring boot project

## how to build the dev environment
docker run -it -v "$PWD":/app -w /app  -p 8080:8080 gradle:jdk17 bash
./gradlew build
java -jar build/libs/demo-0.0.1-SNAPSHOT.jar --host=0.0.0.0
