! Task:
! 
! n is smallest prime such that the difference of successive terms are the
! smallest cubics of positive integers, where n < 15000.
! 
! Category:Prime Numbers

USING: fry io kernel lists lists.lazy math math.functions
math.primes prettyprint ;

2 [ 1 lfrom swap '[ 3 ^ _ + ] lmap-lazy [ prime? ] lfilter car ]
lfrom-by [ 15000 < ] lwhile [ pprint bl ] leach nl
