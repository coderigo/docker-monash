# Docker example - web server

This example starts a container running an [NGINX](http://nginx.org/en/) web server running on your Docker host.

### Building the image

```bash
# View available docker images
[~]: docker images

# Change into this directory
[~]: cd /path/to/docker-examples/web-server

# Build the docker image for this example (line breaks for readability)
[/path/to/docker-examples/web-server]: docker build \
    --tag="docker-monash/nginx-img" \ # Tag this image with this name
    --rm=true ./ # remove intermediate containers after successful build

# Watch it build. It may take some time the first time you run it.

# Convince yourself the above image has been built
[/path/to/docker-examples/web-server]: docker images

```

### Running the application

```bash
# These commands can be run from anywhere, so we assume you're in your home directory (~)
[~]: docker run \ # run a container
        -d \ # run this container in detached (non-interactive) mode
        -p 80:80 \ # map the docker host port 80 to the container's port 80
        --name="my-web-server" \ # give this container a name for me to refer to it later
        --hostname="my.web.server" \ # give the container a hostname
        docker-monash/nginx-img # base the container off this image (we just built it above!)

# Convince yourself the container is running
[~]: docker ps

# Visit the IP address reported by the following command to see your web server respond
[~]: echo $(echo $DOCKER_HOST | cut -d'/' -f3 | cut -d':' -f1)

# Now kill and remove the container
[~]: docker kill my-web-server && docker rm my-web-server

```