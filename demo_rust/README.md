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


cargo build --release

docker build -t amenigahlouzi/dev-rust -f Dockerfile-run . 