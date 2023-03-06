
# Project Title

mongo php server

## how to build the dev environment

docker build -t amenigahlouzi/myphpimage .
docker push amenigahlouzi/myphpimage

docker run --network demo_network --ip 10.0.0.5 -p 9093:80 -it -v `pwd`:/code -w /code  amenigahlouzi/myphpimage bash

php -S 0.0.0.0:80


