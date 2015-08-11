FROM ubuntu
MAINTAINER sinkcup <sinkcup@163.com>

RUN apt-get update -qq
RUN apt-get upgrade -y
RUN apt-get install -y subversion build-essential libncurses5-dev zlib1g-dev gawk git ccache gettext libssl-dev xsltproc flex liblzma-dev u-boot-tools unzip wget

RUN \
  mkdir -p /root/openwrt/ && \
  cd /root/openwrt/ && \
  wget http://downloads.openwrt.io/vendors/gee/ralink/hc5761-20140619.tar.gz && \
  tar -zxvf hc5761-20140619.tar.gz

ADD . /root/openwrt/hc5761/

RUN \
  cd /root/openwrt/hc5761/ && \
  ./dl.sh

WORKDIR /root/openwrt/hc5761/
