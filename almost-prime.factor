! A k-Almost-prime is a natural number n that is the product of k
! (possibly identical) primes.
! 
! Example:
! 
! 1-almost-primes, where k = 1, are the prime numbers themselves.
! 
! 2-almost-primes, where k = 2, are the semiprimes.
! 
! Task:
! 
! Write a function/method/subroutine/... that generates k-almost primes
! and use it to create a table here of the first ten members of k-Almost
! primes for 1 <  = K <  = 5.
! 
! Related tasks:
! 
! -   Semiprime
! -   :Category:Prime Numbers

USING: formatting fry kernel lists lists.lazy locals
math.combinatorics math.primes.factors math.ranges sequences ;
IN: rosetta-code.almost-prime

: k-almost-prime? ( n k -- ? )
    '[ factors _ <combinations> [ product ] map ]
    [ [ = ] curry ] bi any? ;
    
:: first10 ( k -- seq )
    10 0 lfrom [ k k-almost-prime? ] lfilter ltake list>array ;
    
5 [1,b] [ dup first10 "K = %d: %[%3d, %]\n" printf ] each
