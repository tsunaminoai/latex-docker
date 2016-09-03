FROM ubuntu:xenial
MAINTAINER Fermium LABS srl <info@fermiumlabs.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qy
RUN apt-get install -y -q curl wget nodejs npm build-essential zip
RUN apt-get -y -q install jq python-pip zip ghostscript fonts-roboto texlive-full

WORKDIR /data
VOLUME ["/data"]
