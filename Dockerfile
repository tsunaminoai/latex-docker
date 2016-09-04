FROM ubuntu:xenial
MAINTAINER Fermium LABS srl <info@fermiumlabs.com>
ENV DEBIAN_FRONTEND noninteractive

#Install general dependencies
RUN apt-get -qq -y update 
RUN apt-get -qq -y install  -q curl wget npm build-essential zip python-pip jq

#Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh && chmod +x nodesource_setup.sh
RUN ./nodesource_setup.sh
RUN apt-get -qq -y install nodejs
RUN ln -s /usr/bin/nodejs /usr/bin/node


#Install latex, Roboto font, ghostscript
RUN apt-get -qq -y install  ghostscript fonts-roboto texlive-full
RUN pip install pandoc-fignos pandoc-eqnos pandoc-tablenos

#Log what version of node we're running on
RUN echo "node version $(node -v) running"
RUN echo "npm version $(npm -v) running"

#Download the latest version of pandoc and install it
RUN wget `curl https://api.github.com/repos/jgm/pandoc/releases/latest | jq -r '.assets[] | .browser_download_url | select(endswith("deb"))'` -O pandoc.deb && dpkg -i pandoc.deb && rm pandoc.deb

WORKDIR /data
VOLUME ["/data"]
