# Tauri app builder

This Dockerfile is designed to allow cross-compilation of Rust projects for Windows from a Linux or macOS host. It includes the Rust toolchain and a GNU C++ cross-compiler for Windows, as well as a shared volume for the source code.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)

## Getting started

1. Clone the repository:

    ```bash
    git clone https://github.com/afanasjev82/tauri-app-builder.git
    cd ./tauri-app-builder
    ```

2. Build the image:

   ```bash
   docker build -t tauri-builder .
   ```

   This will create a Docker image named `tauri-builder` that includes the necessary tools for cross-compiling Rust projects for Windows.

3. Usage:

   To use the `tauri-builder` image, you'll need to mount a volume containing your Rust project's source code. You can do this by running the following command:

   ```bash
   docker run --rm -v /path/to/tauri/project:/app tauri-builder /path/to/tauri/project/src-tauri
   ```

   This command will run a container using the rust-cross-compile image and mount the `/path/to/tauri/project` directory as a volume inside the container. The src-tauri directory inside your project will be set as the working directory, and the cargo build command will be executed with the --release flag and the target set to x86_64-pc-windows-gnu. The resulting binary will be placed in the `/path/to/tauri/project/build` directory, which is also mounted as a volume.

## Recommended IDE Setup

- [VS Code](https://code.visualstudio.com/) + [Tauri](https://marketplace.visualstudio.com/items?itemName=tauri-apps.tauri-vscode) + [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)
