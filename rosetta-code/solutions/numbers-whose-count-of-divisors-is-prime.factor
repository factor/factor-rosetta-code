! Task:
! 
! Find positive integers n which count of divisors is prime, but not equal
! to 2, where n < 1,000.
! 
! Stretch goal: (as above), but where n < 100,000.

USING: formatting grouping io kernel math math.primes
math.primes.factors math.ranges sequences sequences.extras ;
FROM: math.extras => integer-sqrt ;

: odd-prime? ( n -- ? ) dup 2 = [ drop f ] [ prime? ] if ;

: pdc-upto ( n -- seq )
    integer-sqrt [1,b]
    [ sq ] [ divisors length odd-prime? ] map-filter ;

100,000 pdc-upto 10 group [ [ "%-8d" printf ] each nl ] each
