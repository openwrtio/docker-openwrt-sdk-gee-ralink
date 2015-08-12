FROM ubuntu:14.04
MAINTAINER sinkcup <sinkcup@163.com>

RUN apt-get update -qq
RUN apt-get upgrade -y
RUN apt-get install -y build-essential ccache flex gawk gettext git liblzma-dev libncurses5-dev libssl-dev python subversion u-boot-tools unzip wget xsltproc zlib1g-dev

RUN wget http://cachefly.cachefly.net/10mb.test && rm 10mb.test

RUN \
  mkdir -p /root/openwrt/ && \
  cd /root/openwrt/ && \
  wget http://downloads.openwrt.io/vendors/gee/ralink/hc5761-20140619.tar.gz && \
  tar -zxvf hc5761-20140619.tar.gz

ADD . /root/openwrt/hc5761/

RUN \
  cd /root/openwrt/hc5761/ && \
  ./dl.sh

RUN \
  cd /root/openwrt/hc5761/ && \
  make package/network/utils/curl/compile V=99

WORKDIR /root/openwrt/hc5761/
