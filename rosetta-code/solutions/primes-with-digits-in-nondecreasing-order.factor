! Task:
! 
! Find all primes (n) with their decimal digits in non-decreasing order,
! where n < 1,000
! 
! Category:Prime Numbers

USING: grouping lists lists.lazy math math.primes.lists
present prettyprint ;

lprimes [ present [ <= ] monotonic? ] lfilter
[ 1000 < ] lwhile [ . ] leach
