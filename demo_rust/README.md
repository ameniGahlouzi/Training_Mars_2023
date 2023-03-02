# Project Title

rust project

## how to build the dev environment
docker run -it -v "$PWD":/app -w /app  rust bash  
cargo init

##  takes dependencies version from this site https://crates.io/
cargo add rocket@0.4.11
cargo add rocket_codegen@0.4.10

## how to build rust-nightly image
docker build -t amenigahlouzi/rust-nightly .

## how to push rust-nightly image to docker hub
docker push amenigahlouzi/rust-nightly

## how to use a rust-nightly image
docker run -it -v "$PWD":/app -w /app  amenigahlouzi/rust-nightly  bash  
cargo run

## how to build hello-rust image
docker build -t amenigahlouzi/hello-rust .

## how to use a hello-rust image
docker run -it -v "$PWD":/app -w /app  amenigahlouzi/hello-rust  bash 
cargo run


<img width="465" alt="image" src="https://user-images.githubusercontent.com/39723480/222470876-163b6042-0815-429f-abf9-3175ff621fad.png">
