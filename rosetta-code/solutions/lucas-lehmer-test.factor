! Lucas-Lehmer Test:
! 
! for p an odd prime, the Mersenne number 2^(p) − 1 is prime if and only
! if 2^(p) − 1 divides S(p − 1) where S(n + 1) = (S(n))² − 2, and
! S(1) = 4.
! 
! Task:
! 
! Calculate all Mersenne primes up to the implementation's maximum
! precision, or the 47^(th) Mersenne prime (whichever comes first).
! 
! Category:Arbitrary precision Category:Arithmetic operations

USING: io math.primes.lucas-lehmer math.ranges prettyprint
sequences ;

47 [1,b] [ lucas-lehmer ] filter
"Mersenne primes:" print
[ "M" write pprint bl ] each nl
