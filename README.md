Latex docker container

[![Docker Pulls](https://img.shields.io/docker/pulls/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/) [![Docker Pulls](https://img.shields.io/docker/automated/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/)  [![Docker Pulls](https://img.shields.io/docker/stars/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/)

This container is intended to be used as a base image in CI builds of latex documentation.

## Features

Includes the following packages and utilities:

* Node.js 
* Pandoc (latest stable)
* Texlive full, from the Ubuntu Xenial repository
* Zip 
* Pandoc extensions:
  * pandoc-fignos
  * pandoc-eqnos
  * pandoc-tablenos

## Usage

Pull image ([from Hub](https://registry.hub.docker.com/u/fermiumlabs/latex)):

```bash
docker pull fermiumlabs/latex-docker
```

Or build:

```bash
git clone https://github.com/fermiumlabs/latex-docker.git
cd latex-docker
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
box: fermiumlabs/latex-docker
```
