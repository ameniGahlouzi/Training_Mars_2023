# Project Title

webservice hello word with python flask.

## how to build python flask image
docker build -t amenigahlouzi/python-flask .

## how to push python flask image to docker hub
docker push amenigahlouzi/python-flask

## how to use an python flask image
 docker run -it -v "$PWD":/app -w /app  -p 5002:5000 amenigahlouzi/python-flask  bash 
 python hello.py

## try now with this url
http://127.0.0.1:5002

<img width="375" alt="image" src="https://user-images.githubusercontent.com/39723480/222405670-cd37a286-5024-4a0c-8824-a14b7673eeca.png">







