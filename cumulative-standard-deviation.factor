! Write a stateful function, class, generator or co-routine that takes a
! series of floating point numbers, one at a time, and returns the running
! standard deviation of the series.
! 
! The task implementation should use the most natural programming style of
! those listed for the function in the implementation language; the task
! must state which is being used.
! 
! Do not apply Bessel's correction; the returned standard deviation should
! always be computed as if the sample seen so far is the entire
! population.
! 
! Test case:
! 
! Use this to compute the standard deviation of this demonstration set,
! {2, 4, 4, 4, 5, 5, 7, 9}, which is 2.
! 
! Related tasks:
! 
! -   Random numbers

USING: accessors io kernel math math.functions math.parser
sequences ;
IN: standard-deviator

TUPLE: standard-deviator sum sum^2 n ;

: <standard-deviator> ( -- standard-deviator )
    0.0 0.0 0 standard-deviator boa ;

: current-std ( standard-deviator -- std )
    [ [ sum^2>> ] [ n>> ] bi / ]
    [ [ sum>> ] [ n>> ] bi / sq ] bi - sqrt ;

: add-value ( value standard-deviator -- )
    [ nip [ 1 + ] change-n drop ]
    [ [ + ] change-sum drop ]
    [ [ [ sq ] dip + ] change-sum^2 drop ] 2tri ;

: main ( -- )
    { 2 4 4 4 5 5 7 9 }
    <standard-deviator> [ [ add-value ] curry each ] keep
    current-std number>string print ;
