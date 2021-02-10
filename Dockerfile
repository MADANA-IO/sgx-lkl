FROM ubuntu:18.04

EXPOSE 56000
EXPOSE 56002

ENV SGXLKL_TAP=sgxlkl_tap0 \
    SGXLKL_IP4=192.168.100.1 \
    SGXLKL_GW4=192.168.100.254 \
    SGXLKL_WG_IP=192.168.99.1

WORKDIR /sgx-lkl

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
  iproute2 iptables net-tools libjson-c-dev libprotobuf-c-dev bc \
  curl libjson-c3 unzip libcurl4-openssl-dev cryptsetup && \
  rm -rf /var/lib/apt/lists/*

COPY hardware hardware/
COPY simulation simulation/
COPY tools tools/
