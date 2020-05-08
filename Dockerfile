FROM gcc:8.3

RUN set -ex && \
    apt-get update && \
    apt-get install -y \
        cmake 

RUN mkdir -p /drogon

COPY . /drogon

WORKDIR /drogon

RUN set -ex && \
    git submodule init && git submodule update && \
    mkdir -p  build && cd build && \
    cmake .. && \
    make -j 4 

#WORKDIR /drogon/build

#CMD ["./cpphttp"]
