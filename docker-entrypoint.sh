#!/bin/sh
set -e

# Copy WebView2Loader.dll into the release folder
mkdir -p /app/build/x86_64-pc-windows-gnu/release/
cp /opt/webview2/WebView2Loader.dll /app/build/x86_64-pc-windows-gnu/release/

# Set the working directory to /app/src-tauri
cd /app/src-tauri

# Pass the source code location as an argument to cargo
exec cargo build --release --target x86_64-pc-windows-gnu --target-dir /app/build --color always "$@"