# An image for MPI
# based on : http://www.geodict.com/mpich2Linux.php?lang=en
#
# Build the image with:
#   docker-compose build
# 
# Run the application with:
#   docker-compose up
# 
# Kill and clean up after the application with:
#   docker-compose kill && docker-compose rm


# What image should this image extend?
FROM docker-monash/mpi-img

# Who can you contact re this image?
MAINTAINER Rodrigo Martell <rodrigo.martell@gmail.com>


# Install and configure passwordless SSH
EXPOSE 22
ADD ssh-keys /root/.ssh/
RUN yum -y install \
    ntp \
    ntpdate \
    openssh-server \
    openssh-clients && \
    sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config && \
    mv /root/.ssh/node1-id_rsa.pub /root/.ssh/id_rsa.pub && \
    mv /root/.ssh/node1-id_rsa /root/.ssh/id_rsa && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys && \
    echo -e "Host * \n    StrictHostKeyChecking no" >> /root/.ssh/config && \
    chmod 700 ~/.ssh && \
    chmod 600 ~/.ssh/* && \
    echo root:dockermonash | chpasswd && \
    echo "%sudo ALL=(ALL:ALL) ALL" >> /etc/sudoers && \
    echo "%root ALL=(ALL:ALL) ALL" >> /etc/sudoers && \
    echo "%mpiexec ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Make mpiexec user (needed for mpi to execute on any node)
RUN useradd mpiexec && \
    echo mpiexec:mpiexec | chpasswd && \
    usermod -G wheel mpiexec && \
    echo "%wheel ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir /home/mpiexec/.ssh && \
    mv /root/.ssh/node1-mpi-id_rsa.pub /home/mpiexec/.ssh/id_rsa.pub && \
    mv /root/.ssh/node1-mpi-id_rsa /home/mpiexec/.ssh/id_rsa && \
    cat /home/mpiexec/.ssh/id_rsa.pub >> /home/mpiexec/.ssh/authorized_keys && \
    cat /home/mpiexec/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys && \
    chmod 700 /home/mpiexec/.ssh && \
    chmod 600 /home/mpiexec/.ssh/*

# Add a MPI example code
ADD helloworld_multihost.c /docker-monash-mpi/helloworld_multihost.c
ADD matmult_multihost.c /docker-monash-mpi/matmult_multihost.c

# Add the start script we want to run on container startup
ADD run_mpi_example.sh /docker-monash-mpi/

# Set the default container's command
CMD /docker-monash-mpi/run_mpi_example.sh
