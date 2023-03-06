
# Project Title

mongo mongo database

## how to build the dev environment

docker build -t mongodb-image .


docker run --network demo_network --ip 10.0.0.100 -d -p 27019:27017 --name mongodb-container mongodb-image


docker exec -it mongodb-container bash

mongosh
use test
db.items.find()

