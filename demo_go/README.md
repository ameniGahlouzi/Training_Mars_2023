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

<img width="351" alt="image" src="https://user-images.githubusercontent.com/39723480/222470186-78b5dc4f-3262-44d5-90d0-aa1357d619de.png">
