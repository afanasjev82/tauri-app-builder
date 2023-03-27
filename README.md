# Tauri app builder

This Dockerfile is designed to allow cross-compilation of Rust projects for Windows from a Linux or macOS host. It includes the Rust toolchain and a GNU C/C++ cross-compiler for Windows, as well as a shared volume for the source code.

And also this repo demonstrates how to locally compile lightweight [Tauri](https://github.com/tauri-apps/tauri) applications to Windows executable (win64) using example Tauri application project [tauri-app-builder](https://github.com/afanasjev82/tauri-app-builder) and [tauri-app-vanilla](https://github.com/afanasjev82/tauri-app-vanilla).

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
   docker build -t tauri-app-builder .
   ```

   This will create a Docker image named `tauri-app-builder` that includes the necessary tools for cross-compiling Rust projects for Windows.

3. Usage:

   To use the `tauri-app-builder` image, you'll need to mount a volume containing your Rust project's source code. You can do this by running the following command:

   ```bash
   docker run --rm -v /path/to/tauri/project:/app tauri-app-builder
   ```

   This command will run a container using the rust-cross-compile image and mount the `/path/to/tauri/project` directory as a volume inside the container. The src-tauri directory inside your project will be set as the working directory, and the cargo build command will be executed with the --release flag and the target set to x86_64-pc-windows-gnu. The resulting binary will be placed in the `/path/to/tauri/project/build` directory, which is also mounted as a volume.

## Example

To compile example Tauri project `tauri-app-vanilla` using `tauri-app-builder` image, please do the following:

1. (optional) If repo was cloned without `--recursive`, initialize repo's submodules

   ```bash
   git submodule init
   git submodule update
   ```

   This will clone `tauri-app-vanilla` example Tauri application source into `<current_dir>/tauri-app-vanilla`.

2. Build `tauri-app-vanilla` Windows executable using our `tauri-app-builder`:

   ```bash
   docker run --rm -v $(pwd)/tauri-app-vanilla:/app tauri-app-builder
   ```

   And then you compiled executable will wait you in the `<current_dir>/tauri-app-vanilla/build` folder.

## Recommended IDE Setup

- [VS Code](https://code.visualstudio.com/) + [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
