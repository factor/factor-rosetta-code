! Task:
! 
! Let given list:
! 
! Primes = [2,43,81,122,63,13,7,95,103]
! 
! Show on this page the ascending ordered list of primes from given list.

USING: math.primes prettyprint sequences sorting ;

{ 2 43 81 122 63 13 7 95 103 } [ prime? ] filter natural-sort . 
