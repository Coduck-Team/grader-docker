FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    gcc g++ \
    python3 pypy3 \
    openjdk-8-jdk-headless \
    git make pkg-config libcap-dev libsystemd-dev asciidoc
RUN git clone https://github.com/ioi/isolate.git
RUN cd isolate && make install
RUN rm -rf isolate
RUN useradd -m judge

WORKDIR /home/judge