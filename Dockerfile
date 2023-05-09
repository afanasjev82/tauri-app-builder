# Start with a base image that includes Rust and Cargo
FROM --platform=linux/amd64 rust:alpine

# Set the build TARGET environment variable
ENV TARGET="x86_64-pc-windows-gnu"

# Updating app deps 
RUN apk update && \ 
	apk add --no-cache --update \
	cmake \
	openssl-dev \
	pkgconfig \
	build-base \
	mingw-w64-gcc

# Install toolchain
RUN rustup toolchain install --force-non-host stable-$TARGET

# Install build target
RUN rustup target add $TARGET

# Set GNU compiler as default
RUN rustup set default-host $TARGET

# Create a sharable volume for the installed crates and app folder
VOLUME /app

# Copy WebView2Loader.dll into the container
RUN mkdir -p /opt/webview2
COPY WebView2Loader.dll /opt/webview2/WebView2Loader.dll

# Copy the entrypoint script into the container
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Execute build step
ENTRYPOINT ["docker-entrypoint.sh"]