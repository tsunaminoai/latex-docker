FROM ubuntu:xenial

MAINTAINER TsunamiNoAi
ENV HOME /root

ENV DEBIAN_FRONTEND noninteractive

# Install general dependencies
RUN apt-get -qq -y update
RUN apt-get -qq -y install curl wget npm build-essential zip python-pip jq git libfontconfig

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh && chmod +x nodesource_setup.sh
RUN ./nodesource_setup.sh
RUN apt-get -qq -y install nodejs
RUN ln -s --force /usr/bin/nodejs /usr/bin/node

# Install latest TexLive
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar -zxvf install-tl-unx.tar.gz
ADD texlive.profile .
RUN install-*/install-tl --profile=texlive.profile
RUN rm -rf install-tl*

#Export useful paths
ENV PATH /opt/texbin:$PATH
ENV PATH /usr/local/texlive/2016/bin/x86_64-linux:$PATH

# Update all texlive packages
RUN tlmgr update --self --all

# Test Latex
RUN wget ftp://www.ctan.org/tex-archive/macros/latex/base/small2e.tex
RUN latex  small2e.tex
RUN xelatex small2e.tex

# Install Roboto font, ghostscript, pandoc extensions
RUN apt-get -qq -y install  ghostscript fonts-roboto
RUN pip install --upgrade pip
RUN pip install pandoc-fignos pandoc-eqnos pandoc-tablenos

# Log what version of node we're running on
RUN echo "node version $(node -v) running"
RUN echo "npm version $(npm -v) running"

# Download the latest version of pandoc and install it
RUN wget `curl https://api.github.com/repos/jgm/pandoc/releases/latest | jq -r '.assets[] | .browser_download_url | select(endswith("deb"))'` -O pandoc.deb
RUN dpkg -i pandoc.deb && rm pandoc.deb

# Install chktex
RUN apt-get -qq -y install chktex

WORKDIR /data
VOLUME ["/data"]
