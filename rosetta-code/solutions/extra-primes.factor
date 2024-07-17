! Definition
! 
! n is an extra prime if n is prime and its decimal digits and sum of
! digits are also primes.
! 
! Task
! 
! Show the extra primes under 10,000.
! 
! Reference
! 
! OEIS:A062088 - Primes with every digit a prime and the sum of the digits
! a prime.
! 
! Related tasks:
! 
! -   Numbers with prime digits whose sum is 13
! -   Smarandache prime-digital sequence
! -   :Category:Prime Numbers

USING: formatting io kernel math math.functions math.primes
sequences sequences.extras ;

: digit ( seq seq -- seq ) [ suffix ] cartesian-map concat ;
: front ( -- seq ) { { 2 } { 3 } { 5 } { 7 } } ;
: middle ( seq -- newseq ) { 2 3 5 7 } digit ;
: end ( seq -- newseq ) { 3 7 } digit ;

: candidates ( -- seq )
    front
    front end
    front middle end
    front middle middle end
    append append append ;

: digits>number ( seq -- n )
    <reversed> 0 [ 10^ * + ] reduce-index ;

"The extra primes with up to 4 digits are:" print
candidates
[ sum prime? ] filter
[ digits>number ] [ prime? ] map-filter
[ 1 + swap "%2d: %4d\n" printf ] each-index
