! Task:
! 
! Find and show on this page the 10001st prime number.

USING: math math.primes prettyprint ;

2 10,000 [ next-prime ] times .
