# Project Title

spring boot project

## how to build the dev environment
docker run -it -v "$PWD":/app -w /app  -p 8080:8080 gradle:jdk17 bash
./gradlew build
java -jar build/libs/demo-0.0.1-SNAPSHOT.jar --host=0.0.0.0


## how to prepare prod image
docker build -t  amenigahlouzi/spring-boot-prod1 -f Dockerfile-prod .
docker push amenigahlouzi/spring-boot-prod1

## how to test prod image
docker run -d --network demo_network --ip 10.0.0.6 -p 8084:8080  amenigahlouzi/spring-boot-prod1 

## how to run prod image on server
docker run -d --network training-march --ip 172.18.0.24 -p 8080:8080  amenigahlouzi/spring-boot-prod1 