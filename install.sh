#/bin/sh

mkdir -p /usr/lib/emscripten
cd /usr/lib/emscripten
git clone https://github.com/emscripten-core/emsdk.git .
./emsdk update
./emsdk install latest
./emsdk activate latest
