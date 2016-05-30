xcomic-docker
=============

This repository contains a `Dockerfile` built for setting up an old LAMP stack
for running [Xcomic][xcomic], an outdated comic management script for
publishing of web comics. The stack consists of: Debian 4.0 (Etch), 
Apache 2.2.3, PHP 4.4.4, and MySQL 5.0. This setup is outdated and difficult
to replicate on physical hardware but is well-suited for a Docker image to
run older PHP scripts for demonstration purposes.

[xcomic]: https://github.com/mikexstudios/xcomic

## Usage

1. Checking out the repository and making your edits, build the `Dockerfile`:
   `docker build -t mikexstudios/xcomic-docker .`

2. Then run it like:
   `docker run -p 80:80 mikexstudios/xcomic-docker`
