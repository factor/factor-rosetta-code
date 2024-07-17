! Task:
! 
! Let p(i) be a sequence of prime numbers. such that 2=p(1), 3=p(2),
! 5=p(3), ...
! 
! Consider the p(1),p(3),p(5), ... ,p(i), for each p(i) < 1,000 and i is
! odd.
! 
! Let sum be any prefix sum of these primesa.
! 
! If sum is prime then print i, p(i) and sum.

USING: assocs assocs.extras kernel math.primes math.statistics
prettyprint sequences.extras ;

1000 primes-upto <evens> dup cum-sum zip [ prime? ] filter-values .
