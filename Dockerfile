FROM ubuntu:xenial
MAINTAINER Fermium LABS srl <info@fermiumlabs.com>
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Install general dependencies
RUN apt-get -qq -y update 
RUN apt-get -qq -y install curl wget npm build-essential zip python-pip jq git

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh && chmod +x nodesource_setup.sh
RUN ./nodesource_setup.sh
RUN apt-get -qq -y install nodejs
RUN ln -s --force /usr/bin/nodejs /usr/bin/node

# Install latex from texlive 2016
RUN git clone https://github.com/scottkosty/install-tl-ubuntu.git
RUN chmod +x ./install-tl-ubuntu/install-tl-ubuntu
RUN ./install-tl-ubuntu/install-tl-ubuntu

# Fix texlive path
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*
ENV PATH /opt/texbin:$PATH

# Update texlive
RUN tlmgr update --self --all

# Install Roboto font, ghostscript, pandoc extensions
RUN apt-get -qq -y install  ghostscript fonts-roboto
RUN pip install --upgrade pip
RUN pip install pandoc-fignos pandoc-eqnos pandoc-tablenos

#Log what version of node we're running on
RUN echo "node version $(node -v) running"
RUN echo "npm version $(npm -v) running"

#Download the latest version of pandoc and install it
RUN wget `curl https://api.github.com/repos/jgm/pandoc/releases/latest | jq -r '.assets[] | .browser_download_url | select(endswith("deb"))'` -O pandoc.deb
RUN dpkg -i pandoc.deb && rm pandoc.deb

WORKDIR /data
VOLUME ["/data"]
