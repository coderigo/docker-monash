## Start a container with hadoop 2.7.0
See the container's author's [repo](https://github.com/sequenceiq/hadoop-docker) for more details on the base image. You can inspect their [`Dockerfile`](https://github.com/sequenceiq/hadoop-docker/blob/master/Dockerfile) to see what goes into the setup.

To build a docker image that extends from SequenceIQ's, `cd` into this directory (`hadoop-02`) and:

```bash
docker build --tag="monash-hadoop-02" --rm=true .
```

To start a container from this image, `cd` into this directory (`hadoop-02`) and:

```bash
docker run -it \
    --hostname="hadoop-02" \
    --name="hadoop-02" \
    --volume $(pwd)/for-container:/tmp/from-container-host \
    monash-hadoop-02 \
    /etc/bootstrap.sh -bash
```

The above command will start a container and start hadoop within it. Once set up, it will put you into a shell inside the container. It will map the [for-container](for-container) directory into the container, which can be found in its `/tmp/from-container-host` directory.

Once finished, you can simply type `exit` to exit the container and stop and remove the container with `docker stop hadoop-02 && docker rm hadoop-02`

## Running the lab examples

Inside the container, you can run the lab commands by running the shell script in `/tmp/from-container-host/lab_commands.sh`. Alternatively, you can play around and do it yourself, remembering that HDFS is installed in `/usr/local/hadoop/bin/hdfs` and hadoop in `/usr/local/hadoop/bin/hadoop`.