! Task:
! 
! Write a boolean function that tells whether a given integer is prime
! using Wilson's theorem.
! 
! By Wilson's theorem, a number p is prime if and only if p divides
! (p - 1)! + 1.
! 
! Remember that 1 and all non-positive integers are not prime.
! 
! See also:
! 
! -   Cut-the-knot: Wilson's theorem.
! -   Wikipedia: Wilson's theorem

USING: formatting grouping io kernel lists lists.lazy math
math.factorials math.functions prettyprint sequences ;

: wilson ( n -- ? ) [ 1 - factorial 1 + ] [ divisor? ] bi ;
: prime? ( n -- ? ) dup 2 < [ drop f ] [ wilson ] if ;
: primes ( -- list ) 1 lfrom [ prime? ] lfilter ;

"n    prime?\n---  -----" print
{ 2 3 9 15 29 37 47 57 67 77 87 97 237 409 659 }
[ dup prime? "%-3d  %u\n" printf ] each nl

"First 120 primes via Wilson's theorem:" print
120 primes ltake list>array 20 group simple-table. nl

"1000th through 1015th primes:" print
16 primes 999 [ cdr ] times ltake list>array
[ pprint bl ] each nl
