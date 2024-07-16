! Generate and show here, the first twenty Perfect totient numbers.
! 
! Related task:
! 
! -   -   Totient function
! 
! Also see:
! 
! -   -   the OEIS entry for perfect totient numbers.
!     -   mrob list of the first 54

USING: formatting kernel lists lists.lazy math
math.primes.factors ;

: perfect? ( n -- ? )
    [ 0 ] dip dup [ dup 2 < ] [ totient tuck [ + ] 2dip ] until
    drop = ;

20 1 lfrom [ perfect? ] lfilter ltake list>array
"%[%d, %]\n" printf
