#!/bin/bash
# Regenerates SSH keys and drops its public key into slave node's image dir.
ssh-keygen -q -t rsa -N '' -C "root@node1.mpimultihost" -f node1-id_rsa
ssh-keygen -q -t rsa -N '' -C "mpiexec@node1.mpimultihost" -f node1-mpi-id_rsa
