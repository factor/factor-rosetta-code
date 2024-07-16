! [Illustration of FIFO behavior]
! 
! Task:
! 
! Implement a FIFO queue.
! 
! Elements are added at one side and popped from the other in the order of
! insertion.
! 
! Operations:
! 
! -   -   push (aka enqueue) - add element
!     -   pop (aka dequeue) - pop first element
!     -   empty - return truth value when empty
! 
! Errors:
! 
! -   handle the error of trying to pop from an empty queue (behavior
!     depends on the language and platform)
! 
! See:
! 
! -   Queue/Usage for the built-in FIFO or queue of your language or
!     standard library.

USING: accessors kernel ;
IN: rosetta-code.queue-definition

TUPLE: queue head tail ;
TUPLE: node value next ;

: <queue> ( -- queue ) queue new ;
: <node> ( obj -- node ) node new swap >>value ;

: empty? ( queue -- ? ) head>> >boolean not ;

: enqueue ( obj queue -- )
    [ <node> ] dip 2dup dup empty?
    [ head<< ] [ tail>> next<< ] if tail<< ;

: dequeue ( queue -- obj )
    dup empty? [ "Cannot dequeue empty queue." throw ] when
    [ head>> value>> ] [ head>> next>> ] [ head<< ] tri ;
