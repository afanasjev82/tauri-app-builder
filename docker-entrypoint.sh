#!/bin/sh
set -e

# Copy WebView2Loader.dll into the release folder
mkdir -p /app/build/$TARGET/release/
cp /opt/webview2/WebView2Loader.dll /app/build/$TARGET/release/

# Set the working directory to /app/src-tauri
cd /app/src-tauri

# Pass the source code location as an argument to cargo
exec cargo build --release --target $TARGET --target-dir /app/build --color always "$@"