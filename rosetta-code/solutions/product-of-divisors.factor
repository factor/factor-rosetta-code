! Given a positive integer, return the product of its positive divisors.
! 
! Task
! 
! Show the result for the first 50 positive integers.
! 
! Category:Mathematics

USING: grouping io math.primes.factors math.ranges prettyprint
sequences ;

"Product of divisors for the first 50 positive integers:" print
50 [1,b] [ divisors product ] map 5 group simple-table.
