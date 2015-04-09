# An image for MPI
# based on : http://www.geodict.com/mpich2Linux.php?lang=en
#
# Build the image with:
#   docker build --tag="docker-monash/mpi-img" --rm=true ./
# 
# Run a container in the background based on the image with:
#   docker run --name="singlenode.mpi" --hostname="singlenode.mpi" docker-monash/mpi-img
# 
# Run a container interactively based on the image with:
#   docker run -it --name="singlenode.mpi" --hostname="singlenode.mpi" docker-monash/mpi-img bash
# 
# To clean up the container after it runs or finishes:
#   docker kill singlenode.mpi && docker rm singlenode.mpi

# What OS do you want for this image?
FROM centos:centos6

# Who can you contact re this image?
MAINTAINER Rodrigo Martell <rodrigo.martell@gmail.com>

# Install MPICH (loosely based on: https://www.mpich.org/documentation/guides/)
RUN yum clean all -y && \
    yum update -y && \
    yum install -y \
        mpich \
        mpich-autoload \
        mpich-devel && \
    source /root/.bash_profile && \
    mkdir /docker-monash-mpi

# Add a MPI example code
ADD helloworld.c /docker-monash-mpi/helloworld.c
ADD matmult.c /docker-monash-mpi/matmult.c

# Add the start script we want to run on container startup
ADD run_mpi_example.sh /docker-monash-mpi/

# Set the default container's command
CMD /docker-monash-mpi/run_mpi_example.sh
