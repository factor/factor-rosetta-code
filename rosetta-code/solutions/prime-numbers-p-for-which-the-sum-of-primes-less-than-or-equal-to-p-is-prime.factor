! Task:
! 
! Find primes p for which the sum of primes less than or equal to p is
! prime, where p < 1,000.

USING: assocs assocs.extras kernel math.primes math.statistics
prettyprint ;

1000 primes-upto dup cum-sum zip [ prime? ] filter-values .
