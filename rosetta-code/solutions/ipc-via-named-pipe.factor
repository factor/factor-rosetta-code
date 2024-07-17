! Named pipe, or FIFO, is a way of providing inter-process communications
! (IPC). The task is to demonstrate how it works, create two pipes, say,
! "in" and "out" (choose suitable names for your system), and write a
! program that works the two pipes such that:
! 
! 1.  Data written to the "in" FIFO will be discarded except the byte
!     count, which will be added to a total tally kept by the program;
! 2.  Whenever another process reads the "out" FIFO, it should receive the
!     total count so far.
! 
! Possible issues:
! 
! -   Chances are you don't already have "in" and "out" pipes lying
!     around. Create them within your program or without, at your
!     discretion. You may assume they are already created for you.
! -   Your program may assume it's the sole reader on "in" and the sole
!     writer on "out".
! -   Read/write operations on pipes are generally blocking. Make your
!     program responsive to both pipes, so that it won't block trying to
!     read the "in" pipe while leaving another process hanging on the
!     other end of "out" pipe indefinitely -- or vice versa. You probably
!     need to either poll the pipes or use multi-threading.
! -   You may assume other processes using the pipes behave;
!     specificially, your program may assume the process at the other end
!     of a pipe will not unexpectedly break away before you finish reading
!     or writing.


