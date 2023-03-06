FROM ocaml/opam:debian-ocaml-4.12

# Install system dependencies
RUN sudo apt-get update && \
    sudo apt-get install -y m4 pkg-config zlib1g-dev opam

# Install OCaml dependencies
RUN opam update && \
    eval $(opam env) && \
    opam install -y dune

# Copy the application files
COPY . /app
WORKDIR /app

# Build the application
RUN eval $(opam env) && \
    dune --root . build

# Run the application
CMD ["_build/default/app.exe"]
