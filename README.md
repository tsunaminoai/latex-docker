Latex docker container

[![Docker Pulls](https://img.shields.io/docker/pulls/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/) [![Docker Pulls](https://img.shields.io/docker/automated/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/)  [![Docker Pulls](https://img.shields.io/docker/stars/fermiumlabs/latex-docker.svg?maxAge=2592000)](https://hub.docker.com/r/fermiumlabs/latex-docker/)

This container helps compiling latex sources without the need to install all latex packages on your system.

It includes the following packages and utilities

* Node.js 
* Pandoc (latest stable)
* Texlive full, from the Ubuntu Xenial repository
* Zip 
* Pandoc extensions:
  * pandoc-fignos
  * pandoc-eqnos
  * pandoc-tablenos


First, add your local user to docker group:
```bash
sudo usermod -aG docker YOURUSERNAME
```

Pull image ([from Hub](https://registry.hub.docker.com/u/fermiumlabs/latex)):
```bash
docker pull fermiumlabs/latex
```
or build:
```bash
docker build -t fermiumlabs/latex .

```

Usage:
-----

```bash
cd example

# Double to process refs
../dockercmd.sh pdflatex example.tex
../dockercmd.sh pdflatex example.tex

# Or better in one go (does not start container twice)
../dockercmd.sh /bin/sh -c "pdflatex example.tex && pdflatex example.tex"

# View
./example.pdf
```
Use `dockercmd.sh` to execute any command you like inside the container. `WORKDIRs` match, mounted to `/data` inside container.

Why should I use this container?
-----

- Easy setup
- Preserves UID and GID of local user
- Use container like local command
- `texlive-full` covers most of the available packages
