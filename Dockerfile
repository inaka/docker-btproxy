FROM debian:8.2

ENV BUILD_PACKAGES="bluez bluez-tools libbluetooth-dev python-dev wget zip python-pip"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get clean &&\
    apt-get -y update && \
    apt-get -y dist-upgrade && \
    apt-get install -y $BUILD_PACKAGES && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/conorpp/btproxy/archive/master.zip -O /tmp/master.zip

RUN cd /tmp ; unzip /tmp/master.zip ; cd btproxy-master ; python setup.py install

WORKDIR /workdir
