! Task:
! 
! Show on this page the first 20 prime sums of two consecutive integers.
! 
! Extra credit
! 
! Show the ten millionth such prime sum.

USING: arrays formatting kernel lists lists.lazy math
math.primes.lists sequences ;

20 lprimes cdr [ 2/ dup 1 + 2array ] lmap-lazy ltake
[ dup sum suffix "%d + %d = %d\n" vprintf ] leach
