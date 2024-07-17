! Task:
! 
! Show the syntax for a complete stoppage of a program inside a
! conditional.
! 
! This includes all threads/processes which are part of your program.
! 
! Explain the cleanup (or lack thereof) caused by the termination
! (allocated memory, database connections, open files, object
! finalizers/destructors, run-on-exit hooks, etc.).
! 
! Unless otherwise described, no special cleanup outside that provided by
! the operating system is provided.
! 
! Category:Simple

USING: kernel system ;

t [ 0 exit ] when
