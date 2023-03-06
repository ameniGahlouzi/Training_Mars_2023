# Project Title

rust project

## how to build the dev environment
docker run -it -v "$PWD":/app -w /app -p 8082:8080 golang bash  

go build -o bin/main main.go



## how to build go image
docker build -t amenigahlouzi/go-app .

## how to push go image to docker hub
docker push amenigahlouzi/go-app 

## how to use a go image
docker run -p 8082:8080 amenigahlouzi/go-app


## how to prepare prod image
docker build -t  amenigahlouzi/go-app -f Dockerfile-prod .
docker push amenigahlouzi/go-app

## how to test prod image
docker run -d --network demo_network --ip 10.0.0.5  -p 8083:8080 amenigahlouzi/go-app

## how to run prod image on server
docker run -d --network training-march --ip 172.18.0.23 -p 8082:8080  amenigahlouzi/go-app

<img width="351" alt="image" src="https://user-images.githubusercontent.com/39723480/222470186-78b5dc4f-3262-44d5-90d0-aa1357d619de.png">
