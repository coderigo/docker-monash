# Docker example - mpi

This example starts a container running two single-host MPI programs:

1. A simple `hello world` program, which you can inspect (and alter) in [helloworld.c](helloworld.c).

1. A simple `matmult` (matrix multiplication) program, which you can inspect (and alter) in [matmult.c](matmult.c).

### Building the image

```bash
# View available docker images
[~]: docker images

# Change into this directory
[~]: cd /path/to/docker-examples/mpi

# Build the docker image for this example (line breaks for readability)
[/path/to/docker-examples/mpi]: docker build
        --tag="docker-monash/mpi-img" \ # Tag this image with this name
        --rm=true ./ # remove intermediate containers after successful build

# Watch it build. It may take some time the first time you run it.

# Convince yourself the above image has been built
[/path/to/docker-examples/mpi]: docker images

```

### Running the application

```bash
# These commands can be run from anywhere, so we assume you're in your home directory (~)
[~]: docker run \
    --name="singlenode.mpi" \
    --hostname="singlenode.mpi" \
    docker-monash/mpi-img

# Alternatively, you can run the example interactively WITHIN the container with:
[~]: docker run \
    --name="singlenode.mpi" \
    --hostname="singlenode.mpi" \
    -it \ # This tells docker to run the container interactively
    docker-monash/mpi-img \
    bash # this tells docker to run the bash when the container starts

    # Now you are INSIDE the container you just started. Kind of like SSH-ing into it
    [root@singlenode /]: cd docker-monash-mpi/
    # Run the example
    [root@singlenode docker-monash-mpi/]: ./run_mpi_example.sh
    # watch the example run
    # Exit the container and let it die.
    [root@singlenode docker-monash-mpi/]: exit

# Convince yourself the container has run
[~]: docker ps -a

# Now kill and remove the container
[~]: docker kill singlenode.mpi && docker rm singlenode.mpi

```

### Notes

These containers will sip on your local computer's RAM and munch on CPU using Docker's defaults. You can, if you so wish, play around with docker `run` options `--cpu-shares` and `--cpuset` to limit how much of a CPU a container is allowed to use or which CPUs it can use respectively. You can also limit the memory it sips on using the `--memory` option. Check out the [docs](http://docs.docker.com/reference/commandline/cli/#run) for more info and also [here](http://agileek.github.io/docker/2014/08/06/docker-cpuset/) for a great example.