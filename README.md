# GeneWeb Docker Image
A docker image for [GeneWeb](https://github.com/geneweb/geneweb)

## Usage

### Pre-build Image
You probably want to use the latest pre-built image on Docker Hub. You can run a new container from this image like so:
```bash
docker run -d --name geneweb -p 2316:2316 -p 2317:2317 -v geneweb-data:/geneweb/bases callumgare/geneweb:latest
```

To use start GeneWeb with a language other than english set the LANGUAGE environment variable: `-e LANGUAGE=de`

One thing to know is that for security reasons GeneWeb runs under a user with the user id 999 and the group id 999 inside of the container. Therefore if you're mounting a path on the host to the `/geneweb/bases` dir you'll need to make sure that directory and any files inside it have the correct file permissions.
```bash
chown -R 999:999 /path/to/dir/you/want/to/mount
```

### Building an Image
If you want to build and run an image directly from this repo then you can use:
```
docker-compose up
```
