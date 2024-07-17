! Task:
! 
! Find the sequence of increasing primes, q, from 2 up to but excluding
! 16,000, where the successor of q is the least prime, p, such that p - q
! is a perfect square.
! 
! Category:Prime Numbers

USING: fry io kernel lists lists.lazy math math.primes prettyprint ;

2 [ 1 lfrom swap '[ sq _ + ] lmap-lazy [ prime? ] lfilter car ]
lfrom-by [ 16000 < ] lwhile [ pprint bl ] leach nl
