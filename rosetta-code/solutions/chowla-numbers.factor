! Chowla numbers are also known as:
! 
! -   -   Chowla's function
!     -   chowla numbers
!     -   the chowla function
!     -   the chowla number
!     -   the chowla sequence
! 
! The chowla number of n is (as defined by Chowla's function):
! 
! -   -   the sum of the divisors of n excluding unity and n
!     -   where n is a positive integer
! 
! The sequence is named after Sarvadaman D. S. Chowla, (22 October 1907
! ──► 10 December 1995),
! 
! a London born Indian American mathematician specializing in number
! theory.
! 
! German mathematician Carl Friedrich Gauss (1777─1855) said:
! 
!    "Mathematics is the queen of the sciences ─ and number theory is the queen of mathematics".
! 
! Definitions:
! 
! Chowla numbers can also be expressed as:
! 
!    
!    chowla(n) = sum of divisors of  n  excluding unity and  n
!    chowla(n) = sum(       divisors(n))   - 1 - n 
!    chowla(n) = sum( properDivisors(n))   - 1       
!    chowla(n) = sum(aliquotDivisors(n))   - 1        
!    chowla(n) = aliquot(n)                - 1       
!    chowla(n) = sigma(n)                  - 1 - n 
!    chowla(n) = sigmaProperDivisiors(n)   - 1       
! 
!    chowla(a*b) =  a + b,   if  a  and  b  are distinct primes
!    if  chowla(n) =  0,      and n > 1,  then   n   is prime
!    if  chowla(n) =  n - 1,  and n > 1,  then   n   is a perfect number
!     
! 
! Task:
! 
! -   -   create a chowla function that returns the chowla number for a
!         positive integer n
!     -   Find and display (1 per line) for the 1^(st) 37 integers:
!         -   -   the integer (the index)
!             -   the chowla number for that integer
!     -   For finding primes, use the chowla function to find values of
!         zero
!     -   Find and display the count of the primes up to 100
!     -   Find and display the count of the primes up to 1,000
!     -   Find and display the count of the primes up to 10,000
!     -   Find and display the count of the primes up to 100,000
!     -   Find and display the count of the primes up to 1,000,000
!     -   Find and display the count of the primes up to 10,000,000
!     -   For finding perfect numbers, use the chowla function to find
!         values of n - 1
!     -   Find and display all perfect numbers up to 35,000,000
!     -   use commas within appropriate numbers
!     -   show all output here
! 
! Related tasks:
! 
! -   -    totient function
!     -    perfect numbers
!     -   Proper divisors
!     -   Sieve of Eratosthenes
! 
! See also:
! 
! -   -   the OEIS entry for A48050 Chowla's function.

USING: formatting fry grouping.extras io kernel math
math.primes.factors math.ranges math.statistics sequences
tools.memory.private ;
IN: rosetta-code.chowla-numbers

: chowla ( n -- m )
    dup 1 = [ 1 - ] [ [ divisors sum ] [ - 1 - ] bi ] if ;

: show-chowla ( n -- )
    [1,b] [ dup chowla "chowla(%02d) = %d\n" printf ] each ;

: count-primes ( seq -- )
    dup 0 prefix [ [ 1 + ] dip 2 <range> ] 2clump-map
    [ [ chowla zero? ] count ] map cum-sum
    [ [ commas ] bi@ "Primes up to %s: %s\n" printf ] 2each ;

: show-perfect ( n -- )
    [ 2 3 ] dip '[ 2dup * dup _ > ] [
        dup [ chowla ] [ 1 - = ] bi
        [ commas "%s is perfect\n" printf ] [ drop ] if
        [ nip 1 + ] [ nip dupd + ] 2bi
    ] until 3drop ;

: chowla-demo ( -- )
    37 show-chowla nl { 100 1000 10000 100000 1000000 10000000 }
    count-primes nl 35e7 show-perfect ;

MAIN: chowla-demo
