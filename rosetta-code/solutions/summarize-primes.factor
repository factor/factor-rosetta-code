! Task:
! 
! Considering in order of length, n, all sequences of consecutive primes,
! p, from 2 onwards, where p < 1000 and n>0, select those sequences whose
! sum is prime, and for these display the length of the sequence, the last
! item in the sequence, and the sum.

USING: assocs formatting kernel math.primes math.ranges
math.statistics prettyprint ;

1000 [ [1,b] ] [ primes-upto cum-sum ] bi zip
[ nip prime? ] assoc-filter
[ "The sum of the first  %3d  primes is  %5d  (which is prime).\n" printf ] assoc-each
