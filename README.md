xcomic-docker
=============

This repository contains a `Dockerfile` built for setting up an old LAMP stack
for running [Xcomic][xcomic] (last stable version, 0.8.3), an outdated comic
management script for publishing of web comics. The stack consists of: Debian
4.0 (Etch), Apache 2.2.3, PHP 4.4.4, and MySQL 5.0. This setup is outdated and
difficult to replicate on physical hardware but is well-suited for a Docker
image to run older PHP scripts for demonstration purposes.

[xcomic]: https://github.com/mikexstudios/xcomic

## Usage

1. Checking out the repository and making your edits, build the `Dockerfile`:
   `docker build -t mikexstudios/xcomic-docker .`

2. Run it like:
   `docker run -d -p 80:80 mikexstudios/xcomic-docker`

3. Then access the script from a browser at the docker's IP address. For 
   example if using boot2docker, get the exposed IP address with:
   `boot2docker ip`.

4. Install Xcomic with:
   - Database type: MySQL 4.x
   - Database host: `localhost`
   - Database name: `app`
   - Database user: `root`
   - Database password: leave blank
   - Leave all other fields default.

**NOTE**: Changes will not be saved when Docker container exits!

## Troubleshooting

If things go wrong, get a shell on the image for debugging:

`docker run -p 80:80 -it mikexstudios/xcomic-docker /bin/bash`

or connect to an already running image:

`docker exec -it [containerid] /bin/bash`
