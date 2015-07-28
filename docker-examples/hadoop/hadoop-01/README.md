## Start a container with hadoop 2.7.0
See the container's author's [repo](https://github.com/sequenceiq/hadoop-docker) for more details. You can inspect their [`Dockerfile`](https://github.com/sequenceiq/hadoop-docker/blob/master/Dockerfile) to see what goes into the setup.

To start a container from this image, `cd` into this directory (`hadoop-01`) and:

```bash
docker run -it \
    --hostname="hadoop-01" \
    --name="hadoop-01" \
    --volume $(pwd)/for-container:/tmp/from-container-host \
    sequenceiq/hadoop-docker:2.7.0 \
    /etc/bootstrap.sh -bash
```

The above command will start a container and start hadoop within it. Once set up, it will put you into a shell inside the container. It will map the [for-container](for-container) directory into the container, which can be found in its `/tmp/from-container-host` directory.

Once finished, you can simply type `exit` to exit the container and stop and remove the container with `docker stop hadoop-01 && docker rm hadoop-01`

## If the above commands have already been executed and hadoop-01 setup then
 docker start hadoop-01
 docker attach hadoop-01
is sufficient
 
## Running the lab examples

Inside the container, you can run the lab commands by running the shell script in `/tmp/from-container-host/lab_commands.sh`. Alternatively, you can play around and do it yourself, remembering that HDFS is installed in `/usr/local/hadoop/bin/hdfs`.