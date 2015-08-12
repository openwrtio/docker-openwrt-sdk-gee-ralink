#!/bin/bash
set -ex

mkdir -p dl
cat dl.txt | while read line
do
    wget "http://downloads.openwrt.io/sources/"$line -O dl/$line
done
