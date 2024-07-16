! Calculate the sequence where each term a_(n) is the n^(th) that has n
! divisors.
! 
! Task
! 
! Show here, on this page, at least the first 15 terms of the sequence.
! 
! See also
! 
! -   -   OEIS:A073916
! 
! Related tasks
! 
! -   -   Sequence: smallest number greater than previous term with
!         exactly n divisors
!     -   Sequence: smallest number with exactly n divisors

USING: combinators formatting fry kernel lists lists.lazy
lists.lazy.examples literals math math.functions math.primes
math.primes.factors math.ranges sequences ;
IN: rosetta-code.nth-n-div

CONSTANT: primes $[ 100 nprimes ]

: prime ( m -- n ) 1 - [ primes nth ] [ ^ ] bi ;

: (non-prime) ( m quot -- n )
    '[
        [ 1 - ] [ drop @ ] [ ] tri '[ divisors length _ = ]
        lfilter swap [ cdr ] times car
    ] call ; inline

: non-prime ( m quot -- n )
    {
        { [ over 2 = ] [ 2drop 3 ] }
        { [ over 10 = ] [ 2drop 405 ] }
        [ (non-prime) ]
    } cond ; inline

: fn ( m -- n )
    {
        { [ dup even? ] [ [ evens ] non-prime ] }
        { [ dup prime? ] [ prime ] }
        [ [ squares ] non-prime ]
    } cond ;

: main ( -- ) 45 [1,b] [ dup fn "%2d : %d\n" printf ] each ;

MAIN: main
