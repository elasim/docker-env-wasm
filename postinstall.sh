#/bin/sh
pwd
cd /usr/lib/emscripten/
bash -c "source ./emsdk_env.sh && em++ -s WASM=1 -s BINARYEN=1 /tmp/a.cpp -o /tmp/a.out.js"
cat ./emsdk_set_env.sh >> ~/.bashrc


