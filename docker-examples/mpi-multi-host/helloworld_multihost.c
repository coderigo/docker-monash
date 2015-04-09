/* Swiped and adapted from 
    :https://www.dartmouth.edu/~rc/classes/intro_mpi/hello_world_ex.html#top 
*/
#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int main (argc, argv)
    int argc;
    char *argv[];
{
    int rank, size, len;
    char name[MPI_MAX_PROCESSOR_NAME];

    MPI_Init (&argc, &argv);  /* starts MPI */
    MPI_Comm_rank (MPI_COMM_WORLD, &rank);    /* get current process id */
    MPI_Comm_size (MPI_COMM_WORLD, &size);    /* get number of processes */
    MPI_Get_processor_name(name, &len); /* get the hostname */
    printf( "[\e[91m%s\e[0m]: Process %02d of %02d says YO!\n", name, rank, size );
    MPI_Finalize();
    return 0;
}
