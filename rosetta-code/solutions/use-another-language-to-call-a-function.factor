! This task is inverse to the task Call foreign language function.
! Consider the following C program:
! 
!     #include <stdio.h>
! 
!     extern int Query (char * Data, size_t * Length);
! 
!     int main (int argc, char * argv [])
!     {
!        char     Buffer [1024];
!        size_t   Size = sizeof (Buffer);
! 
!        if (0 == Query (Buffer, &Size))
!        {
!           printf ("failed to call Query\n");
!        }
!        else
!        {
!           char * Ptr = Buffer;
!           while (Size-- > 0) putchar (*Ptr++);
!           putchar ('\n');
!        }
!     }
! 
! Implement the missing Query function in your language, and let this C
! program call it. The function should place the string Here am I into the
! buffer which is passed to it as the parameter Data. The buffer size in
! bytes is passed as the parameter Length. When there is no room in the
! buffer, Query shall return 0. Otherwise it overwrites the beginning of
! Buffer, sets the number of overwritten bytes into Length and returns 1.


