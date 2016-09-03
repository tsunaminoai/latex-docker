FROM ubuntu:xenial
MAINTAINER Fermium LABS srl <info@fermiumlabs.com>
ENV DEBIAN_FRONTEND noninteractive

#Install general dependencies
RUN apt-get -qq update -y
RUN apt-get -qqinstall -y -q curl wget nodejs npm build-essential zip python-pip jq
RUN ln -s /usr/bin/nodejs /usr/bin/node

#Install latex, Roboto font, ghostscript
RUN apt-get -qq install -y ghostscript fonts-roboto texlive-full
RUN pip install pandoc-fignos pandoc-eqnos pandoc-tablenos

#Log what version of node we're running on
RUN echo "node version $(node -v) running"
RUN echo "npm version $(npm -v) running"

#Download the latest version of pandoc and install it
RUN wget `curl https://api.github.com/repos/jgm/pandoc/releases/latest | jq -r '.assets[] | .browser_download_url | select(endswith("deb"))'` -O pandoc.deb && sudo dpkg -i pandoc.deb && rm pandoc.deb

WORKDIR /data
VOLUME ["/data"]
