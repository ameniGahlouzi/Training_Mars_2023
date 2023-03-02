# Project Title

hello word with V language.

## how to run this project in docker

docker run -it -v "$PWD":/app -w /app  thevlang/vlang bash

v hello.v -o bin/hello  # compile the program
./bin/hello     # run the program



