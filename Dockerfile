# Start with a base image that includes Rust and Cargo
FROM rust:alpine

# Updating app deps 
RUN apk update

# install GNU C++ cross-compiler
RUN apk --no-cache --update add build-base mingw-w64-gcc

# Install toolchain
RUN rustup toolchain install stable-x86_64-pc-windows-gnu

# Install build target
RUN rustup target add x86_64-pc-windows-gnu 

# Set GNU compiler as default
RUN rustup set default-host x86_64-pc-windows-gnu

# Create a shared volume for the source code
VOLUME /app

# Set working dir to tauri project
WORKDIR /app/src-tauri

# Set the entrypoint to pass the source code location as an argument
ENTRYPOINT [ "cargo", "build", "--release", "--target", "x86_64-pc-windows-gnu", "--target-dir", "/app/build" ]

