#!/bin/bash

# Make sure env vars and settings are read
source /root/.bash_profile

# Start services
echo -e "\e[105m[INFO]:\e[0m \e[95mStarting ntp & ssh \e[0m"
/etc/init.d/ntpd start &>/dev/null && /etc/init.d/sshd start &>/dev/null

# cd into the example directory
cd /docker-monash-mpi

# Compile your helloworld example
echo -e "\e[105m[INFO]:\e[0m \e[95mCompiling helloworld_multihost.c \e[0m"
mpicc -o helloworld_multihost helloworld_multihost.c

# Compile your matmult example
echo -e "\e[105m[INFO]:\e[0m \e[95mCompiling matmult_multihost.c \e[0m"
mpicc -w -o matmult_multihost matmult_multihost.c


# Run the excutable from above with 4 processes
# https://docs.oracle.com/cd/E19356-01/820-3176-10/ExecutingPrograms.html
if [ "$(hostname)" = "node1.mpimultihost" ]; then
    echo -e "\e[105m[INFO]:\e[0m \e[95mRunning helloworld_multihost MPI program from Node1 \e[0m"
    mpirun \
        -hosts node1,node2 \
        -np 40 \
        /docker-monash-mpi/helloworld_multihost

    mpirun \
        -hosts node1,node2 \
        -np 50 \
        /docker-monash-mpi/matmult_multihost
else
    # Hack a way to link back to node1. Basically, find node2's IP address and increment it by 1
    # to get node1's IP address (will break at 255 boundary, of course!)
    # In production, consider serf or weave for two-way linking
    last_ip_number=$(echo $(head -n 1 /etc/hosts | cut -d$'\t' -f1) | cut -d'.' -f4)
    node1_ip="$(echo $(head -n 1 /etc/hosts | cut -d$'\t' -f1) | cut -d'.' -f1-3).$(($last_ip_number + 1))"
    echo -e "$node1_ip   node1.mpimultihost node1" >> /etc/hosts

    # Artificial wait to prevent the process from ending and docker exiting
    loop_count=0
    while [ $loop_count -lt 4 ]; do
        # Sleeping for 1 second to stay alive for node1"
        sleep 5;
        loop_count=$[$loop_count+1]
    done
fi