! The goal of this task is to create a counting semaphore used to control
! the execution of a set of concurrent units. This task intends to
! demonstrate coordination of active concurrent units through the use of a
! passive concurrent unit. The operations for a counting semaphore are
! acquire, release, and count. Each active concurrent unit should attempt
! to acquire the counting semaphore before executing its assigned duties.
! In this case the active concurrent unit should report that it has
! acquired the semaphore. It should sleep for 2 seconds and then release
! the semaphore.

USING: calendar calendar.format concurrency.combinators
concurrency.semaphores formatting kernel sequences threads ;

10 <iota> 2 <semaphore>
[
    [
        dup now timestamp>hms
        "task %d acquired semaphore at %s\n" printf
        2 seconds sleep 
    ] with-semaphore
    "task %d released\n" printf
] curry parallel-each
