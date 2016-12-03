Latex docker container

[![Docker Pulls](https://img.shields.io/docker/pulls/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/) [![Docker Pulls](https://img.shields.io/docker/automated/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/)  [![Docker Pulls](https://img.shields.io/docker/stars/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/) [![](https://images.microbadger.com/badges/image/fermiumlabs/latex-docker.svg)](https://microbadger.com/images/fermiumlabs/latex-docker "Get your own image badge on microbadger.com")

This container is intended to be used as a base image in CI builds of latex documentation. The image is rebuilt every week automatically with the latest LaTex updates.

## Features

Includes the following packages and utilities:

* Node.js 
* Pandoc (latest stable)
* TexLive 2016 full automatically installed from the texlive repository
* Zip 
* Pandoc extensions:
  * pandoc-fignos
  * pandoc-eqnos
  * pandoc-tablenos


## Usage

There are a few useful tags:
* latest: Automated build from the master branch, re-built (at least) every week with updated LaTex.
* latest-develop: Automated build from the develop branch for testing purpose.


Pull image ([from Hub](https://hub.docker.com/r/fermiumlabs/latex-docker/)):

```bash
docker pull fermiumlabs/latex-docker
```

Or build:

```bash
git clone https://github.com/fermiumlabs/latex-docker.git
cd latex-docker
#Beware: building it's a very long process
docker build -t fermiumlabs/latex-docker .
```
Make commands:

```bash
make pull    #pulls the docker container from the prebuilt public image
make build   #build the image from this github repository. long process
make shell   #allows you to interact with the container
make run     #runs the container and then destroys it
make start   #start the container
make stop    #stops the container
make rm      #removes the container
```

#Usage in Wercker CI

Simply add as a first line this statement:

```
box: fermiumlabs/latex-docker:latest
```
 
