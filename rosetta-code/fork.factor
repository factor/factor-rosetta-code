! Task:
! 
! Spawn a new process which can run simultaneously with, and independently
! of, the original parent process.

USING: unix unix.process ;

[ "Hello form child" print flush 0 _exit ] [ drop "Hi from parent" print flush ] with-fork
