FROM ubuntu:18.04

# install prerequisties
RUN apt-get update
RUN apt-get install wget curl build-essential git python cmake openjdk-11-jdk -y

# install
ADD install.sh /tmp/install.sh
RUN /tmp/install.sh

# make env
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -y nodejs
RUN wget -q -O - "https://dl.google.com/closure-compiler/compiler-20190618.tar.gz" | tar xzv
RUN mkdir -p /usr/share/java && cp ./closure-compiler-v20190618.jar /usr/share/java/closure-compiler.jar
# postinstall
ENV PATH="/usr/lib/emscripten:/usr/lib/emscripten/fastcomp/emscripten:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV EMSDK="/usr/lib/emscripten"
ENV EM_CONFIG="/root/.emscripten"
# ENV EMSDK_NODE="/usr/lib/emscripten/node/8.9.1_64bit/bin/node"
ENV EMSDK_NODE="/usr/bin/node"

ADD ./test.cpp /tmp/a.cpp
ADD postinstall.sh /usr/lib/emscripten/postinstall.sh
RUN /usr/lib/emscripten/postinstall.sh

