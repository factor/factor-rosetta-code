! A Tau number is a positive integer divisible by the count of its
! positive divisors.
! 
! Task
! 
! Show the first 100 Tau numbers. The numbers shall be generated during
! run-time (i.e. the code may not contain string literals, sets/arrays of
! integers, or alike).
! 
! Related task
! 
! -    Tau function

USING: assocs grouping io kernel lists lists.lazy math
math.functions math.primes.factors prettyprint sequences
sequences.extras ;

: tau ( n -- count ) group-factors values [ 1 + ] map-product ;

: tau? ( n -- ? ) dup tau divisor? ;

: taus ( -- list ) 1 lfrom [ tau? ] lfilter ;

! Task
"The first 100 tau numbers are:" print
100 taus ltake list>array 10 group simple-table.
