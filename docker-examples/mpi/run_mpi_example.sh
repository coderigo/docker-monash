#!/bin/bash

# Make sure env vars and settings are read
source /root/.bash_profile

# cd into the example directory
cd /docker-monash-mpi

# Compile your helloworld example
echo -e "\e[105m[INFO]:\e[0m \e[95mCompiling helloworld.c \e[0m"
mpicc -o helloworld helloworld.c

# Run the excutable from above with 4 processes
echo -e "\e[105m[INFO]:\e[0m \e[95mRunning helloworld MPI program \e[0m"
# example_start_time="$(date +%s%N)"
mpirun -np 4 ./helloworld
# echo "Time taken: $((($(date +%s%N)-${example_start_time})/1000000)) ms"

# Compile your matmult example
echo -e "\e[105m[INFO]:\e[0m \e[95mCompiling matmult.c \e[0m"
mpicc -w -o matmult matmult.c

# Run the excutable from above with 4 processes
echo -e "\e[105m[INFO]:\e[0m \e[95mRunning matmult MPI program \e[0m"
mpirun -np 50 ./matmult