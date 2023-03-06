# Project Title

ruby server

## how to build the dev environment
docker run --network demo_network --ip 10.0.0.4 -p 8080:8080  -it -v `pwd`:/app -w /app  ruby bash


bundle install
ruby server.rb 

## how to prepare prod image
docker build -t  amenigahlouzi/ruby-prod -f Dockerfile-prod .
docker push amenigahlouzi/ruby-prod

## how to test prod image
docker run -d --network demo_network --ip 10.0.0.4 -p 8080:8080  amenigahlouzi/ruby-prod 

## how to run prod image on server
docker run -d --network training-march --ip 172.18.0.22 -p 8080:8080  amenigahlouzi/ruby-prod 
