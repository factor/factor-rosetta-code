! Given a positive integer, sum its positive divisors.
! 
! Task
! 
! Show the result for the first 100 positive integers.
! 
! Category:Mathematics

USING: grouping io math.primes.factors math.ranges prettyprint
sequences ;

"Sum of divisors for the first 100 positive integers:" print
100 [1,b] [ divisors sum ] map 10 group simple-table.
