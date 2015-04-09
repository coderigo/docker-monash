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
    int rank, size;

    MPI_Init (&argc, &argv);  /* starts MPI */
    MPI_Comm_rank (MPI_COMM_WORLD, &rank);    /* get current process id */
    MPI_Comm_size (MPI_COMM_WORLD, &size);    /* get number of processes */
    printf( "[\e[91m%s\e[0m]: Hello world from process %02d of %02d\n", getenv("HOSTNAME"), rank, size );
    MPI_Finalize();
    return 0;
}
