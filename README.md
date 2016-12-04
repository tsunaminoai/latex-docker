Latex docker container

[![Docker Pulls](https://img.shields.io/docker/pulls/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/) [![Docker Pulls](https://img.shields.io/docker/automated/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/)  [![Docker Pulls](https://img.shields.io/docker/stars/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/) [![](https://images.microbadger.com/badges/image/fermiumlabs/latex-docker.svg)](https://microbadger.com/images/fermiumlabs/latex-docker "Get your own image badge on microbadger.com") [![Analytics](https://ga-beacon.appspot.com/UA-69533556-3/latex-docker/readme/)](https://github.com/igrigorik/ga-beacon)


This container is intended to be used as a base image in CI builds of latex documentation. The image is **rebuilt every week** automatically with the latest LaTex updates.

## Features

Includes the following packages and utilities:

* Node.js 6.x
* Pandoc (latest release on GitHub)
* TexLive 2016 full automatically installed from the TexLive repository
* Zip 
* Pandoc extensions:
  * pandoc-fignos
  * pandoc-eqnos
  * pandoc-tablenos


## Usage

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
make pull    #pull the docker container from the prebuilt public image
make build   #build the image from this GitHub repository. long process
make shell   #allows you to interact with the container
make run     #run the container and then destroys it
make start   #start the container
make stop    #stop the container
make rm      #remove the container and free disk space
```

#Usage in Wercker CI

Simply add as a first line this statement:

```
box: fermiumlabs/latex-docker:latest
```
 
