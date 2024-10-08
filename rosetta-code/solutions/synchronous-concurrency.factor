! The goal of this task is to create two concurrent activities ("Threads"
! or "Tasks", not processes.) that share data synchronously. Your language
! may provide syntax or libraries to perform concurrency. Different
! languages provide different implementations of concurrency, often with
! different names. Some languages use the term threads, others use the
! term tasks, while others use co-processes. This task should not be
! implemented using fork, spawn, or the Linux/UNIX/Win32 pipe command, as
! communication should be between threads, not processes.
! 
! One of the concurrent units will read from a file named "input.txt" and
! send the contents of that file, one line at a time, to the other
! concurrent unit, which will print the line it receives to standard
! output. The printing unit must count the number of lines it prints.
! After the concurrent unit reading the file sends its last line to the
! printing unit, the reading unit will request the number of lines printed
! by the printing unit. The reading unit will then print the number of
! lines printed by the printing unit.
! 
! This task requires two-way communication between the concurrent units.
! All concurrent units must cleanly terminate at the end of the program.


