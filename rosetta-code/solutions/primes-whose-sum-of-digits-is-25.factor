! Task:
! 
! Show primes which sum of its decimal digits is 25
! 
! Find primes n such that n < 5000
! 
! Stretch goal
! 
! Show the count of all such primes that do not contain any zeroes in the
! range:
! 
!     
! 
!         (997 ≤ n ≤ 1,111,111,111,111,111,111,111,111).

USING: kernel lists lists.lazy math math.primes.lists prettyprint ;

: digit-sum ( n -- sum )
    0 swap [ 10 /mod rot + swap ] until-zero ;

: lprimes25 ( -- list ) lprimes [ digit-sum 25 = ] lfilter ;

lprimes25 [ 5,000 < ] lwhile [ . ] leach
