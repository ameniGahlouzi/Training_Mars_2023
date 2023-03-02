# Project Title

angular project

## how to build the dev environment
 docker run -it -v "$PWD":/app -w /app -p 8080:4200 ange10k/angularcli bash
 cd myapp
 ng serve --host=0.0.0.0

## how to build angular image
docker build -t amenigahlouzi/angular .
## how to push angular image to docker hub
docker push amenigahlouzi/angular
## how to use an angular image
 docker run -p 8085:80 amenigahlouzi/angular 


<img width="1425" alt="image" src="https://user-images.githubusercontent.com/39723480/222404413-778f4d8a-d79e-4503-a471-21735f2e6fff.png">
