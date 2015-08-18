# Docker examples

This directory holds a few examples from the [presentation](../docker-preso/index.html) in this same repo.

## Requirements

To run these examples you need:

1. [Docker](http://docker.com). See the official [installation instructions](https://docs.docker.com/installation/). All code snippets in `README` files assume you have docker installed and that you're on a *nix based system (sorry Windows, I haven't played with Docker on you).

1. [Docker Compose](https://docs.docker.com/compose/). Follow the [installation instructions](https://docs.docker.com/compose/install/). This is only needed for the [`mpi-multi-host`](mpi-multi-host) example. It essentially allows you to compose (hence the name) a multi-container app by describing how those containers should be configured and started in a single file: `docker-compose.yml`.

**Update (18 Aug 2015):** Docker recently released the [Docker Toolbox](https://www.docker.com/toolbox) binaries that install a set of Docker binaries that come in handy (`docker`, `docker-compose`, `docker-machine` and other goodies). If you install the toolbox, you use `docker-machine` to start and select the default machine (local) like so:

```bash
docker-machine start default
docker-machine env default
eval "$(docker-machine env default)"
# Now you can see that it is running and set as active
docker-machine ls
# Get the IP address of the docker machine
docker-machine ip default
```

## Gotchas

1. Remember, if you're running docker on an OS that doesn't support LXC by default, you need to run `boot2docker start` (if you haven't installed stuff the toolbox way as above) first. Furthermore, your docker host IP address will not be `localhost/127.0.0.1` it will be the IP address reported by `echo $DOCKER_HOST`.


## Other useful stuff

Although not in this example set yet, here are few great things worth looking into as you begin using Docker more and more:

1. [Docker Machine](https://docs.docker.com/machine/). Create and fire off commands on Docker hosts from your local machine anywhere (cloud, local machine, etc). Already installed if you installed via the toolbox way as described above.

1. [Docker Swarm](https://docs.docker.com/swarm/). Native clustering for Docker. Already installed if you installed via the toolbox way as described above.

1. [Serf](https://serfdom.io/). Cluster self-awareness and event handler. Not part of Docker but useful and interesting to play with.

1. [Weave](https://github.com/zettio/weave). Virtual networking of containers running anywhere (multiple hosts, clouds, etc). Very handy.

1. Patience. As with any new tool, there are kinks and things that are hard to get one's head around initially. So a bit of patience is good to have on tap.