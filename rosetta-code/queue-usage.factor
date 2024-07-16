! [Illustration of FIFO behavior]
! 
! Task:
! 
! Create a queue data structure and demonstrate its operations.
! 
! (For implementations of queues, see the FIFO task.)
! 
! Operations:
! 
! -   -   push (aka enqueue) - add element
!     -   pop (aka dequeue) - pop first element
!     -   empty - return truth value when empty

DL{ } clone {
    [ [ { 1 2 3 } ] dip push-all-front ] ! push all from sequence
    [ .                                ] ! DL{ 3 2 1 }
    [ [ drop ] slurp-deque             ] ! pop and discard all
    [ deque-empty? .                   ] ! t
} cleave
